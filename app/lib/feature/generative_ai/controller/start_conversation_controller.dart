import 'package:app/data.dart';
import 'package:app/feature/generative_ai/state/current_conversation_id_notifier.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class StartConversationController {
  final Ref _ref;

  const StartConversationController(this._ref);

  Future<void> startConversation() async {
    try {
      final conversation = await _ref
          .read(serverpodClientProvider)
          .generativeAI
          .startConversation();

      final id = conversation.id;
      if (id == null) {
        return;
      }

      _ref.read(currentConversationIdProvider.notifier).update(id);
    } catch (e) {
      // TODO: Handle error
    }
  }
}
