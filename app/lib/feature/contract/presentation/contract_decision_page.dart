import 'package:app/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:app/feature/contract/presentation/widget/message_bubble.dart';

@RoutePage()
class ContractDecisionPage extends HookConsumerWidget {
  const ContractDecisionPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDisplayingHistory = useState(false);

    return Scaffold(
      body: Stack(
        children: [
          const Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(),
              child: Center(
                child: Text("ContractDecisionPage"),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 240,
              padding: const EdgeInsets.symmetric(horizontal: 16)
                  .copyWith(bottom: 48),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: FilledButton(
                      style: FilledButton.styleFrom(
                        backgroundColor: Colors.green.withOpacity(0.8),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text("承認"),
                      onPressed: () {
                        context.router.push(const ContractResultSuccessRoute());
                      },
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: FilledButton(
                      style: FilledButton.styleFrom(
                        backgroundColor: Colors.red.withOpacity(0.8),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: () {
                        context.router.push(const ContractResultFailureRoute());
                      },
                      child: const Text("否認"),
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (isDisplayingHistory.value)
            Positioned.fill(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.8),
                ),
                child: ListView.separated(
                  padding: const EdgeInsets.symmetric(horizontal: 16).copyWith(
                      top: MediaQuery.of(context).padding.top + 60, bottom: 24),
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return MessageBubble(
                      message:
                          "MessageMessageMessageMessageMessageMessageMessageMessageMessageMessageMessageMessageMessageMessageMessageMessage  $index",
                      isMine: index.isOdd,
                      maxWidth: null,
                      opacity: 1,
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(height: 8);
                  },
                ),
              ),
            ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(top: 8),
        child: FloatingActionButton(
          child: Icon(
            isDisplayingHistory.value ? Icons.close : Icons.message_outlined,
          ),
          onPressed: () {
            isDisplayingHistory.value = !isDisplayingHistory.value;
          },
        ),
      ),
    );
  }
}
