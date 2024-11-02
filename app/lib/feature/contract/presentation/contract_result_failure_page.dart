import 'package:app/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

@RoutePage()
class ContractResultFailurePage extends StatelessWidget {
  const ContractResultFailurePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            "失敗",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          FilledButton(
            onPressed: () {
              context.router.replaceAll([const OnboardingRoute()]);
            },
            child: const Text("Next"),
          ),
        ],
      ),
    );
  }
}
