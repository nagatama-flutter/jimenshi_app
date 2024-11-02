import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final appThemeTypeProvider =
    NotifierProvider.autoDispose<AppThemeTypeNotifier, AppThemeType>(
        AppThemeTypeNotifier.new);

final appThemeDataProvider =
    NotifierProvider.autoDispose<AppThemeDataNotifier, ThemeData>(
        AppThemeDataNotifier.new);

enum AppThemeType { light, dart }

class AppThemeTypeNotifier extends AutoDisposeNotifier<AppThemeType> {
  @override
  AppThemeType build() {
    return AppThemeType.light;
  }

  void toggle() {
    state = switch (state) {
      AppThemeType.light => AppThemeType.dart,
      AppThemeType.dart => AppThemeType.light,
    };
  }
}

class AppThemeDataNotifier extends AutoDisposeNotifier<ThemeData> {
  @override
  ThemeData build() {
    final type = ref.watch(appThemeTypeProvider);

    return switch (type) {
      AppThemeType.light => _lightTheme,
      AppThemeType.dart => _dartTheme,
    };
  }

  ThemeData get _lightTheme => ThemeData.light().copyWith(
        splashFactory: NoSplash.splashFactory,
        inputDecorationTheme: _inputDecorationTheme,
        appBarTheme: _appBarTheme,
        textTheme: GoogleFonts.notoSansJpTextTheme(),
      );

  ThemeData get _dartTheme => ThemeData.dark().copyWith(
        splashFactory: NoSplash.splashFactory,
        inputDecorationTheme: _inputDecorationTheme,
        appBarTheme: _appBarTheme,
        textTheme: GoogleFonts.notoSansJpTextTheme(),
      );

  InputDecorationTheme get _inputDecorationTheme => InputDecorationTheme(
        isDense: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      );

  AppBarTheme get _appBarTheme => const AppBarTheme(
        iconTheme: IconThemeData(size: 18, weight: 600),
      );
}

extension TextThemeExtension on TextTheme {
  TextStyle get text32Semibold => const TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.w600,
      );
}
