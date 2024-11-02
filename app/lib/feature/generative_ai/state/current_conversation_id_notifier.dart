import 'package:hooks_riverpod/hooks_riverpod.dart';

/// 現在の会話IDを管理するプロバイダ
///
/// グローバルステートのため適切に管理してください
final currentConversationIdProvider =
    NotifierProvider<CurrentConversationIdNotifier, int?>(
        CurrentConversationIdNotifier.new);

class CurrentConversationIdNotifier extends Notifier<int?> {
  @override
  int? build() {
    return null;
  }

  void update(int id) {
    state = id;
  }
}
