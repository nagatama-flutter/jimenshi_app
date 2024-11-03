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
      body: Stack(
        children: [
          // フルスクリーンの失敗画像
          Positioned.fill(
            child: Assets.images.failure.image(
              fit: BoxFit.cover,
            ),
          ),
          // 必要に応じて半透明のオーバーレイを追加（視認性向上のため）
          Positioned.fill(
            child: Container(
              color: Colors.black.withOpacity(0.3), // 30%の黒いオーバーレイ
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
                    "見破り失敗！！！",
                    style: Theme.of(context)
                        .textTheme
                        .text32Semibold
                        .copyWith(color: Colors.white), // テキスト色を白に設定
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 24),
                  FilledButton(
                    style: FilledButton.styleFrom(
                      backgroundColor: Colors.redAccent.withOpacity(0.8),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      "もう一度挑戦する",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                    onPressed: () {
                      context.router.replaceAll([const OnboardingRoute()]);
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
