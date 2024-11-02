import 'package:app/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:app/feature/contract/presentation/widget/message_bubble.dart';

@RoutePage()
class ContractNegotiationPage extends HookConsumerWidget {
  const ContractNegotiationPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final focusNode = useFocusNode();

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                Positioned.fill(
                  left: 16,
                  child: ListView.separated(
                    padding: const EdgeInsets.only(bottom: 12),
                    reverse: true,
                    itemBuilder: (context, index) {
                      return MessageBubble(
                        isMine: index % 2 == 0,
                        message:
                            "message messagemessagemessagemessagemessagemessagemessagemessagemessagemessagemessagemessage $index",
                      );
                    },
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 8),
                    itemCount: 50,
                  ),
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
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              decoration: BoxDecoration(color: Theme.of(context).cardColor),
              child: Row(
                children: [
                  Expanded(
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxHeight: 160),
                      child: TextFormField(
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
                    onPressed: () {
                      focusNode.unfocus();
                    },
                    icon: const Icon(Icons.send),
                  ),
                ],
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
