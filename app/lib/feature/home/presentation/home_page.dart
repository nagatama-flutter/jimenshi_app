import 'package:app/feature/auth.dart';
import 'package:app/feature/generative_ai/controller/post_message_controller.dart';
import 'package:app/feature/generative_ai/presentation/widget/message_list.dart';
import 'package:app/feature/generative_ai/state/conversation_list_notifier.dart';
import 'package:app/feature/generative_ai/state/current_conversation_id_notifier.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class HomePage extends HookConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final conversationsList = ref.watch(conversationListProvider);
    final conversationId = ref.watch(currentConversationIdProvider);

    final textController = useTextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat Page'),
      ),
      drawer: Drawer(
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: conversationsList.when(
                  data: (data) {
                    return ListView.separated(
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text('ConversationID ${data[index].id}'),
                          onTap: () {
                            final id = data[index].id;
                            if (id != null) {
                              ref
                                  .read(currentConversationIdProvider.notifier)
                                  .update(id);
                            }
                          },
                        );
                      },
                      separatorBuilder: (_, __) => const SizedBox(height: 5),
                      itemCount: data.length,
                    );
                  },
                  error: (error, stackTrace) {
                    return Text(
                      'Error: $error',
                      style: const TextStyle(color: Colors.red),
                    );
                  },
                  loading: () => const Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
              ),
              ListTile(
                title: const Text(
                  'サインアウト',
                  style: TextStyle(color: Colors.red),
                ),
                onTap: () {
                  ref.read(signOutControllerProvider(context)).signOut();
                },
              ),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: conversationId != null
                ? MessageList(conversationId)
                : const Center(
                    child: Text('はじめてのメッセージを送信しよう'),
                  ),
          ),
          const Divider(height: 1),
          SafeArea(
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxHeight: 160),
                      child: TextFormField(
                        maxLines: null,
                        controller: textController,
                        onTapOutside: (_) => FocusScope.of(context).unfocus(),
                        keyboardType: TextInputType.multiline,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Send a message',
                          contentPadding: EdgeInsets.all(16),
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.send),
                    onPressed: () async {
                      if (textController.text.isEmpty) {
                        return;
                      }

                      await ref
                          .read(postMessageControllerProvider)
                          .postMessage(textController.text);

                      if (!context.mounted) {
                        return;
                      }

                      textController.clear();
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
