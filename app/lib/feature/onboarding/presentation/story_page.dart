import 'package:app/data/story.dart';
import 'package:app/feature/generative_ai/controller.dart';
import 'package:app/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class StoryPage extends ConsumerWidget {
  const StoryPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                      introductionSimazaki,
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
                  ref
                      .read(startConversationControllerProvider(context))
                      .startConversation();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
