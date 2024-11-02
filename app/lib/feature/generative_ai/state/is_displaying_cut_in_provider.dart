import 'package:hooks_riverpod/hooks_riverpod.dart';

final isDisplayingCutInProvider = NotifierProvider.autoDispose
    .family<IsDisplayingCutInNotifier, bool, int>(
        IsDisplayingCutInNotifier.new);

class IsDisplayingCutInNotifier extends AutoDisposeFamilyNotifier<bool, int> {
  @override
  bool build(int arg) {
    return false;
  }

  void notify(bool value) {
    state = value;
  }
}
