import 'package:app_server/src/config/config.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:riverpod/riverpod.dart';

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
  }) async {
    final chatSession = _generativeModel.startChat(
        history: history?.map((e) => e.toContent()).toList());

    return chatSession.sendMessageStream(Content.text(content));
  }
}

class HistoryContent {
  final String content;
  final bool isUser;

  const HistoryContent(this.content, this.isUser);
}

extension on HistoryContent {
  Content toContent() {
    return isUser ? Content.text(content) : Content.model([TextPart(content)]);
  }
}
