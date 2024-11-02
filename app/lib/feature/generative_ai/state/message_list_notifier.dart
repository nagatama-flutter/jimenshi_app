import 'package:app/data.dart';
import 'package:app/feature/generative_ai/data.dart';
import 'package:app/feature/generative_ai/domain.dart';
import 'package:app/feature/generative_ai/state.dart';
import 'package:client/sample_pod_client.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

typedef ConversationId = int;

final messageListProvider = AsyncNotifierFamilyProvider.autoDispose<
    MessageListNotifier,
    List<Message>,
    ConversationId>(MessageListNotifier.new);

class MessageListNotifier
    extends AutoDisposeFamilyAsyncNotifier<List<Message>, ConversationId> {
  @override
  Future<List<Message>> build(ConversationId arg) async {
    ref.watch(dataStreamNotifierProvider).stream.listen((message) {
      if (message is GenerativeAIMessage) {
        updateMessage(message);
      } else if (message is GenerativeAISpeechAudio) {
        print('text to speech audio file: ${message.audioFileUrl}');
      } else if (message is GenerativeAICutIn) {
        ref.read(isDisplayingCutInProvider(arg).notifier).notify(true);
      }
    });

    final response = await ref
        .watch(serverpodClientProvider)
        .generativeAI
        .getMessageList(arg);

    return response.map((e) => e.toMessage()).toList();
  }

  Future<void> updateMessage(GenerativeAIMessage message) async {
    state.whenData((value) {
      if (value.isEmpty) {
        state = AsyncValue.data([message.toMessage()]);
        return;
      }

      var list = [...value];
      final index = list.indexWhere((e) => e.id == message.id);
      if (index != -1) {
        list[index] = message.toMessage();
      } else {
        list.add(message.toMessage());
      }

      state = AsyncValue.data(list);
    });
  }
}

extension on GenerativeAIMessage {
  Message toMessage() {
    return switch (messageType) {
      GenerativeAIMessageType.input =>
        InputMessage(id, content, image?.byteData?.buffer.asUint8List()),
      GenerativeAIMessageType.output => GeneratedMessage(id, content),
    };
  }
}
