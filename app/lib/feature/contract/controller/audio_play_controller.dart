import 'package:app/feature/web/js_handler.dart'
    if (dart.library.io) 'package:app/feature/web/js_handler_for_mobile.dart'
    if (dart.library.html) 'package:app/feature/web/js_handler_for_web.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter/foundation.dart';
import 'package:video_player/video_player.dart';
// import 'package:video_player/video_player.dart';

final audioPlayControllerProvider =
    Provider.autoDispose<AudioPlayController>((_) => AudioPlayController());

class AudioPlayController {
  Future<void> play(
    String audioFileUrl, {
    VoidCallback? onPlay,
    VoidCallback? onPlayEnd,
  }) async {
    if (kIsWeb) {
      print('playSound: $audioFileUrl');
      runJavaScript('playSound', audioFileUrl);
    } else {
      final videoController = VideoPlayerController.networkUrl(
        Uri.parse(audioFileUrl),
        videoPlayerOptions: VideoPlayerOptions(mixWithOthers: true),
      );

      videoController.addListener(() {
        if (!videoController.value.isInitialized) {
          return;
        }
        if (videoController.value.duration == videoController.value.position) {
          onPlayEnd?.call();
          return;
        }
      });

      await videoController.initialize();

      await videoController.setLooping(false);
      await videoController.setVolume(1.0);

      await videoController.play();
    }

    onPlay?.call();
  }
}
