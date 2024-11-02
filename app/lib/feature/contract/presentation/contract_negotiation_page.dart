import 'package:app/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class ContractNegotiationPage extends HookConsumerWidget {
  const ContractNegotiationPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final focusNode = useFocusNode();

    return Scaffold(
      body: Column(
        children: [
          const Expanded(
            child: Center(
              child: Text("ContractNegotiationPage"),
            ),
          ),
          const Divider(),
          SafeArea(
            top: false,
            child: Container(
              decoration: BoxDecoration(color: Theme.of(context).cardColor),
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      focusNode: focusNode,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                      onTapOutside: (event) => focusNode.unfocus(),
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
