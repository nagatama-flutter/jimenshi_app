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
      body: Stack(
        children: [
          // 背景の塔の画像
          Positioned.fill(
            child: Assets.images.tower.image(
              fit: BoxFit.cover,
            ),
          ),
          // 半透明のハリソンの画像を重ねる
          Positioned.fill(
            child: Opacity(
              opacity: 0.5, // 透明度を50%に設定
              child: Assets.images.halison.image(
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return const Center(
                    child: Icon(Icons.error, color: Colors.red, size: 50),
                  );
                },
              ),
            ),
          ),
          // グラデーションを追加（オプション）
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.black.withOpacity(0.3),
                    Colors.transparent,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
          ),
          // コンテンツを中央に配置
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                mainAxisSize: MainAxisSize.min, // コンテンツを必要最低限の高さに
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    '地面師を見破れ',
                    style: Theme.of(context)
                        .textTheme
                        .text32Semibold
                        .copyWith(color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 24),
                  FilledButton(
                    child: const Text('はじめる'),
                    onPressed: () {
                      context.router.push(const OnboardingRoute());
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
