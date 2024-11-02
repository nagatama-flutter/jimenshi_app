import 'package:app/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

@RoutePage()
class StoryPage extends StatelessWidget {
  const StoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Expanded(
            child: Center(
              child: Text("StoryPage"),
            ),
          ),
          SafeArea(
            child: FilledButton(
              child: const Text("Next"),
              onPressed: () {
                context.router.push(const ContractNegotiationRoute());
              },
            ),
          ),
        ],
      ),
    );
  }
}
