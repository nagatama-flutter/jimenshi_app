import 'package:app/router/app_router.dart';
import 'package:app/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

@RoutePage()
class StoryPage extends StatelessWidget {
  const StoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 24),
                    Text(
                      'この物語のはじまり',
                      style: Theme.of(context).textTheme.text32Semibold,
                      textAlign: TextAlign.start,
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'ここにストーリーが入ります。ここにストーリーが入ります。ここにストーリーが入ります。ここにストーリーが入ります。ここにストーリーが入ります。ここにストーリーが入ります。ここにストーリーが入ります。ここにストーリーが入ります。ここにストーリーが入ります。ここにストーリーが入ります。',
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24.0,
                vertical: 24.0,
              ),
              child: FilledButton(
                child: const Text('交渉はじめる'),
                onPressed: () {
                  context.router.push(const ContractNegotiationRoute());
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
