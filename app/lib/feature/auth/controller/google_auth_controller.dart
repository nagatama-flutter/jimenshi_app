import 'package:app/feature/auth/usecase.dart';
import 'package:app/router.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final googleAuthControllerProvider = Provider.autoDispose
    .family<GoogleAuthController, BuildContext>(GoogleAuthController.new);

class GoogleAuthController {
  final Ref _ref;
  final BuildContext _context;

  const GoogleAuthController(this._ref, this._context);

  Future<void> signIn() async {
    final result = await _ref.read(googleAuthUseCaseProvider).signIn();

    if (result && _context.mounted) {
      _context.router.replaceAll([const HomeRoute()]);
    }
  }
}
