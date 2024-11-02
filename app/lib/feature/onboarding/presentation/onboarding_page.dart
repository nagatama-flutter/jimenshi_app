import 'package:app/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

@RoutePage()
class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            "OnboardingPage",
            textAlign: TextAlign.center,
          ),
          FilledButton(
            child: const Text("Next"),
            onPressed: () {
              context.router.push(const StoryRoute());
            },
          ),
        ],
      ),
    );
  }
}
