import 'dart:typed_data';
import 'package:app_server/src/config/prompt_message.dart';
import 'package:app_server/src/generated/protocol.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:riverpod/riverpod.dart';

import '../config/config.dart';

final geminiProvider = Provider<GeminiProvider>((ref) {
  const model = 'gemini-1.5-flash-latest';
  final config = ref.watch(configProvider);
  final generativeModel = GenerativeModel(
    model: model,
    apiKey: config.geminiAPIKey,
  );

  return GeminiProvider(generativeModel, model);
});

class GeminiProvider {
  final GenerativeModel _generativeModel;
  final String _modelName;

  const GeminiProvider(this._generativeModel, this._modelName);

  String get modelName => _modelName;

  Future<Stream<GenerateContentResponse>> sendMessage(
    String content, {
    List<HistoryContent>? history,
    GenerativeAIImage? image,
  }) async {
    final chatSession = _generativeModel.startChat(
        history: history?.map((e) => e.toContent()).toList());

    // テキストパートを作成
    final textPart = TextPart(promptMessage + content);
    // 画像がある場合、DataPartとして作成
    if (image != null) {
      Uint8List uint8Data = image.byteData!.buffer.asUint8List(
          image.byteData!.offsetInBytes, image.byteData!.lengthInBytes);
      final imagePart = DataPart(image.mimeType!, uint8Data);

      // テキストと画像を含むコンテンツを送信
      return chatSession
          .sendMessageStream(Content.multi([textPart, imagePart]));
    }

    // テキストのみの場合
    return chatSession.sendMessageStream(Content.text(promptMessage + content));
  }
}

class HistoryContent {
  final String content;
  final bool isUser;
  final GenerativeAIImage? image;

  const HistoryContent(
    this.content,
    this.isUser, [
    this.image,
  ]);
}

extension on HistoryContent {
  Content toContent() {
    if (isUser) {
      if (image != null) {
        Uint8List? uint8ImageData;
        if (image!.byteData != null) {
          uint8ImageData = image!.byteData!.buffer.asUint8List(
              image!.byteData!.offsetInBytes, image?.byteData!.lengthInBytes);
        }
        final textPart = TextPart(content);
        final dataPart = DataPart(image!.mimeType!, uint8ImageData!);
        return Content.multi([textPart, dataPart]);
      } else {
        return Content.text(content);
      }
    } else {
      // モデルからのレスポンス
      return Content.model([TextPart(content)]);
    }
  }
}
