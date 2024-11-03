import 'package:app/gen/assets.gen.dart';
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
      body: Stack(
        children: [
          // フルスクリーンの正しい画像
          Positioned.fill(
            child: Assets.images.correct.image(
              fit: BoxFit.cover,
              // エラーハンドリング（オプション）
              errorBuilder: (context, error, stackTrace) {
                return const Center(
                  child: Icon(Icons.error, color: Colors.red, size: 50),
                );
              },
            ),
          ),
          // コンテンツのオーバーレイ
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                mainAxisSize: MainAxisSize.min, // コンテンツを必要最低限の高さに
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    "見破り成功！！！",
                    style: Theme.of(context)
                        .textTheme
                        .text32Semibold
                        .copyWith(color: Colors.white), // テキスト色を白に設定
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 24),
                  FilledButton(
                    style: FilledButton.styleFrom(
                      backgroundColor: Colors.green.withOpacity(0.8),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text("勝利を噛み締めて次のゲームをプレイ"),
                    onPressed: () {
                      context.router.replaceAll([const OnboardingRoute()]);
                    },
                  ),
                ],
              ),
            ),
          ),
          // オプション: テキストの視認性を高めるための半透明オーバーレイ
          Positioned.fill(
            child: Container(
              color: Colors.black.withOpacity(0.3), // 透明度30%の黒色オーバーレイ
            ),
          ),
        ],
      ),
    );
  }
}
