import 'package:app/gen/assets.gen.dart';
import 'package:app/router/app_router.dart';
import 'package:app/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

@RoutePage()
class ContractResultFailurePage extends StatelessWidget {
  const ContractResultFailurePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "見破り失敗！！！",
            style: Theme.of(context).textTheme.text32Semibold,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          SizedBox(
            height: 200,
            child: Assets.images.failure.image(),
          ),
          const SizedBox(height: 48),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: FilledButton(
              child: const Text("もう一度挑戦する"),
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
