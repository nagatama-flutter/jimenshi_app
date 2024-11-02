import 'package:auto_route/auto_route.dart';
import 'package:app/data.dart';
import 'package:app/feature/generative_ai/state.dart';
import 'package:app/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final startConversationControllerProvider = Provider.autoDispose
    .family<StartConversationController, BuildContext>(
        StartConversationController.new);

class StartConversationController {
  final Ref _ref;
  final BuildContext _context;

  const StartConversationController(this._ref, this._context);

  Future<void> startConversation() async {
    try {
      final conversation = await _ref
          .read(serverpodClientProvider)
          .generativeAI
          .startConversation();

      final id = conversation.id;
      if (id == null) {
        // TODO: Handle error
        throw Exception('Failed to start conversation');
      }

      _ref.read(currentConversationIdProvider.notifier).update(id);

      if (_context.mounted) {
        _context.router.push(ContractNegotiationRoute(conversationId: id));
      }
    } catch (e) {
      // TODO: Handle error
      throw Exception('Failed to start conversation');
    }
  }
}
