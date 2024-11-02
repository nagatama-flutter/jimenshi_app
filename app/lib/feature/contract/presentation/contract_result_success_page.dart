import 'package:app/router/app_router.dart';
import 'package:app/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

@RoutePage()
class ContractResultSuccessPage extends StatelessWidget {
  const ContractResultSuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "見破り成功！！！",
            style: Theme.of(context).textTheme.text32Semibold,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          const SizedBox(
            height: 200,
            child: Placeholder(),
          ),
          const SizedBox(height: 48),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: FilledButton(
              child: const Text("勝利を噛み締めて次のゲームをプレイ"),
              onPressed: () {
                context.router.replaceAll([const OnboardingRoute()]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
