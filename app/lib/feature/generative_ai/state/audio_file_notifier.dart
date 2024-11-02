import 'package:hooks_riverpod/hooks_riverpod.dart';

final audioFileProvider = NotifierProvider.autoDispose
    .family<AudioFileNotifier, String, int>(AudioFileNotifier.new);

class AudioFileNotifier extends AutoDisposeFamilyNotifier<String, int> {
  @override
  String build(int arg) {
    return '';
  }

  void notify(String value) {
    state = value;
  }
}
