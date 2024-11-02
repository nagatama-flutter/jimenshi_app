import 'dart:async';

import 'package:app/data.dart';
import 'package:client/sample_pod_client.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final _dataStreamProvider =
    StreamProvider.autoDispose<GenerativeAIMessage>((ref) async* {
  final endpoint = ref.watch(serverpodClientProvider).generativeAI;

  await for (final message in endpoint.stream) {
    if (message is GenerativeAIMessage) {
      yield message;
    } else if (message is GenerativeAISpeechAudio) {
      print('text to speech audio file: ${message.audioFileUrl}');
    } else if (message is GenerativeAICutIn) {
      print('call cut in.');
    }
  }
});

final generativeAIStreamProvider = Provider.autoDispose
    .family<Stream<GenerativeAIMessage>, int>((ref, conversationId) {
  final streamController = StreamController<GenerativeAIMessage>();

  ref.watch(_dataStreamProvider).maybeWhen(
        data: (message) {
          if (message.conversationId == conversationId) {
            streamController.sink.add(message);
          }
        },
        orElse: () {},
      );

  ref.onDispose(() {
    streamController.close();
  });

  return streamController.stream;
});
