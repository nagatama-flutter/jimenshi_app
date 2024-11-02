import 'package:app/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:app/theme.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:app/feature/contract/presentation/widget/message_bubble.dart';
import 'package:app/feature/generative_ai/state.dart';
import 'package:app/feature/generative_ai/domain.dart';
import 'package:app/feature/generative_ai/controller.dart';

@RoutePage()
class ContractNegotiationPage extends HookConsumerWidget {
  final int conversationId;

  const ContractNegotiationPage({super.key, required this.conversationId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final messages = ref.watch(messageListProvider(conversationId));
    final isDisplayingCutIn =
        ref.watch(isDisplayingCutInProvider(conversationId));

    final scrollController = useScrollController();
    final focusNode = useFocusNode();
    final textEditingController = useTextEditingController();

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

    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: Stack(
                  children: [
                    messages.maybeWhen(
                      data: (messages) {
                        if (messages.isEmpty) {
                          return const SizedBox.shrink();
                        }

                        final displayMessages = messages.reversed.toList();

                        return Positioned.fill(
                          left: 16,
                          child: ListView.separated(
                            controller: scrollController,
                            padding: const EdgeInsets.only(bottom: 12),
                            reverse: true,
                            itemBuilder: (context, index) {
                              final message = displayMessages[index];

                              return MessageBubble(
                                isMine: switch (message) {
                                  InputMessage() => true,
                                  GeneratedMessage() => false,
                                },
                                message: message.content,
                              );
                            },
                            separatorBuilder: (context, index) =>
                                const SizedBox(height: 8),
                            itemCount: messages.length,
                          ),
                        );
                      },
                      orElse: () => const SizedBox.shrink(),
                    ),
                    const Center(
                      child: Text("ContractNegotiationPage"),
                    ),
                  ],
                ),
              ),
              const Divider(height: 1),
              SafeArea(
                top: false,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  decoration: BoxDecoration(color: Theme.of(context).cardColor),
                  child: Row(
                    children: [
                      Expanded(
                        child: ConstrainedBox(
                          constraints: const BoxConstraints(maxHeight: 160),
                          child: TextFormField(
                            controller: textEditingController,
                            maxLines: null,
                            keyboardType: TextInputType.multiline,
                            focusNode: focusNode,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                            ),
                            onTapOutside: (event) => focusNode.unfocus(),
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () async {
                          focusNode.unfocus();
                          if (textEditingController.text.isEmpty) {
                            return;
                          }

                          await ref
                              .read(postMessageControllerProvider)
                              .postMessage(conversationId,
                                  textEditingController.text, null);

                          if (context.mounted) {
                            textEditingController.clear();
                          }
                        },
                        icon: const Icon(Icons.send),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          if (isDisplayingCutIn)
            Positioned.fill(
              child: ColoredBox(
                color: Colors.black.withOpacity(0.5),
                child: Center(
                  child: Text(
                    "もうええでしょ！！！！",
                    style: Theme.of(context)
                        .textTheme
                        .text32Semibold
                        .copyWith(color: Colors.white),
                  ),
                ),
              ),
            ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          focusNode.unfocus();
          context.router.push(const ContractDecisionRoute());
        },
        child: const Text("Next"),
      ),
    );
  }
}
