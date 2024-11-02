import 'package:app/data.dart';
import 'package:app/feature/generative_ai/state/current_conversation_id_notifier.dart';
import 'package:client/sample_pod_client.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final postMessageControllerProvider =
    Provider.autoDispose(PostMessageController.new);

class PostMessageController {
  final Ref _ref;

  const PostMessageController(this._ref);

  Future<void> postMessage(String text) async {
    final conversationId =
        _ref.read(currentConversationIdProvider) ?? await _startConversation();

    if (_ref.read(serverpodClientProvider).isStreamingDisconnected) {
      await _ref.read(serverpodClientProvider).openStreamingConnection();
    }

    try {
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        await _ref.read(serverpodClientProvider).generativeAI.sendStreamMessage(
              GenerativeAIMessageRequest(
                conversationId: conversationId,
                content: text,
              ),
            );
      });
    } catch (e) {
      // TODO: Handle error
      rethrow;
    }
  }

  Future<int> _startConversation() async {
    try {
      final conversation = await _ref
          .read(serverpodClientProvider)
          .generativeAI
          .startConversation();

      final id = conversation.id;
      if (id == null) {
        // TODO: Handle error
        throw Exception();
      }

      _ref.read(currentConversationIdProvider.notifier).update(id);
      return id;
    } catch (e) {
      // TODO: Handle error
      rethrow;
    }
  }
}
