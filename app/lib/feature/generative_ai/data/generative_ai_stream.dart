import 'dart:async';

import 'package:app/data.dart';
import 'package:client/sample_pod_client.dart';
import 'package:app/feature/generative_ai/state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final dataStreamNotifierProvider =
    Provider.autoDispose<DataStreamNotifier>((ref) {
  final notifier = DataStreamNotifier(ref);

  ref.onDispose(() {
    notifier.close();
  });

  return notifier;
});

class DataStreamNotifier {
  final Ref _ref;

  DataStreamNotifier(this._ref);

  final _streamController = StreamController<SerializableModel>();

  Stream<SerializableModel> get stream =>
      _ref.read(serverpodClientProvider).generativeAI.stream;

  void close() {
    _streamController.close();
    _ref.read(serverpodClientProvider).generativeAI.resetStream();
  }

  void add(SerializableModel message) {
    if (message is GenerativeAIMessage) {
      _ref
          .read(messageListProvider(message.conversationId).notifier)
          .updateMessage(message);
    }
  }
}
