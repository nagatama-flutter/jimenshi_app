import 'package:hooks_riverpod/hooks_riverpod.dart';

final currentConversationIdProvider =
    NotifierProvider.autoDispose<CurrentConversationIdNotifier, int?>(
        CurrentConversationIdNotifier.new);

class CurrentConversationIdNotifier extends AutoDisposeNotifier<int?> {
  @override
  int? build() {
    return null;
  }

  void update(int id) {
    state = id;
  }
}
