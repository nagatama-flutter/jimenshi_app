import 'package:app/router.dart';
import 'package:app/theme.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appRouter = ref.watch(appRouterProvider);
    final appTheme = ref.watch(appThemeDataProvider);

    return MaterialApp.router(
      routerConfig: appRouter.config(),
      title: 'Serverpod Demo',
      theme: appTheme,
    );
  }
}
