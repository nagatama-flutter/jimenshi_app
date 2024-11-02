import 'package:app/data.dart';
import 'package:client/sample_pod_client.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final conversationListProvider = AsyncNotifierProvider.autoDispose<
    ConversationListNotifier,
    List<GenerativeAIConversation>>(ConversationListNotifier.new);

class ConversationListNotifier
    extends AutoDisposeAsyncNotifier<List<GenerativeAIConversation>> {
  @override
  Future<List<GenerativeAIConversation>> build() async {
    return ref
        .watch(serverpodClientProvider)
        .generativeAI
        .getConversationList();
  }

  Future<void> refresh() async {
    state = const AsyncValue.loading();

    state = await AsyncValue.guard(() async =>
        ref.read(serverpodClientProvider).generativeAI.getConversationList());
  }
}
