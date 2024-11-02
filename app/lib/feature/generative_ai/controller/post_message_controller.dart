import 'dart:io';
import 'dart:typed_data';

import 'package:app/data.dart';
import 'package:client/sample_pod_client.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final postMessageControllerProvider =
    Provider.autoDispose(PostMessageController.new);

class PostMessageController {
  final Ref _ref;

  const PostMessageController(this._ref);

  Future<void> postMessage(
      int conversationId, String text, File? imageFile) async {
    if (_ref.read(serverpodClientProvider).isStreamingDisconnected) {
      await _ref.read(serverpodClientProvider).openStreamingConnection();
    }

    try {
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        // Image オブジェクトを作成
        GenerativeAIImage? image;
        if (imageFile != null) {
          final imageBytes = await imageFile.readAsBytes();
          final mimeType = getMimeType(imageFile.path);
          final imageByteData = ByteData.view(imageBytes.buffer);
          image = GenerativeAIImage(
            byteData: imageByteData,
            mimeType: mimeType,
          );
        }

        // メッセージリクエストを作成
        final request = GenerativeAIMessageRequest(
          conversationId: conversationId,
          content: text,
          image: image,
        );

        // メッセージを送信
        await _ref
            .read(serverpodClientProvider)
            .generativeAI
            .sendStreamMessage(request);
      });
    } catch (e) {
      // TODO: Handle error
      rethrow;
    }
  }

  // MIMEタイプを取得するヘルパーメソッド
  String? getMimeType(String filePath) {
    final extension = filePath.split('.').last.toLowerCase();
    switch (extension) {
      case 'jpg':
      case 'jpeg':
        return 'image/jpeg';
      case 'png':
        return 'image/png';
      case 'gif':
        return 'image/gif';
      default:
        return null;
    }
  }
}
