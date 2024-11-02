import 'package:app/feature/generative_ai/presentation/widget/message_bubble.dart';
import 'package:app/feature/generative_ai/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MessageList extends HookConsumerWidget {
  final int conversationId;

  const MessageList(this.conversationId, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scrollController = useScrollController();

    final messages = ref.watch(messageListProvider(conversationId));

    ref.listen(messageListProvider(conversationId), (_, __) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (scrollController.hasClients) {
          scrollController.animateTo(
            scrollController.position.maxScrollExtent,
            duration: const Duration(milliseconds: 750),
            curve: Curves.easeOutCirc,
          );
        }
      });
    });

    return messages.when(
      data: (messages) {
        return ListView.separated(
          controller: scrollController,
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
          itemCount: messages.length,
          itemBuilder: (context, index) {
            final message = messages[index];
            return MessageBubble(message: message);
          },
          separatorBuilder: (context, index) {
            return const SizedBox(height: 8);
          },
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stackTrace) => Center(child: Text('Error: $error')),
    );
  }
}
