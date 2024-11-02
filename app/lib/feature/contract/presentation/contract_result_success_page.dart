import 'package:app/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

@RoutePage()
class ContractResultSuccessPage extends StatelessWidget {
  const ContractResultSuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            "成功",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          FilledButton(
            child: const Text("Next"),
            onPressed: () {
              context.router.replaceAll([const OnboardingRoute()]);
            },
          ),
        ],
      ),
    );
  }
}
