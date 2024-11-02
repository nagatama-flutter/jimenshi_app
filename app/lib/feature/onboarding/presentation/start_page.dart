import 'package:app/gen/assets.gen.dart';
import 'package:app/router/app_router.dart';
import 'package:app/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

@RoutePage()
class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            '地面師を見破れ',
            style: Theme.of(context).textTheme.text32Semibold,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: SizedBox(
              height: 200,
              child: Assets.images.tower.image(),
            ),
          ),
          const SizedBox(height: 60),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: FilledButton(
              child: const Text('はじめる'),
              onPressed: () {
                context.router.push(const OnboardingRoute());
              },
            ),
          ),
        ],
      ),
    );
  }
}
