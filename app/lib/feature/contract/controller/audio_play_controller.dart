import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:video_player/video_player.dart';

final audioPlayControllerProvider =
    Provider.autoDispose<AudioPlayController>((_) => AudioPlayController());

class AudioPlayController {
  Future<void> play(String audioFileUrl) async {
    final videoController = VideoPlayerController.networkUrl(
      Uri.parse(audioFileUrl),
      videoPlayerOptions: VideoPlayerOptions(mixWithOthers: true),
    );

    await videoController.initialize();

    await videoController.setLooping(false);
    await videoController.setVolume(1.0);

    await videoController.play();
  }
}
