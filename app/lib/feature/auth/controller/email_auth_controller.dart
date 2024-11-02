import 'package:app/feature/auth/usecase.dart';
import 'package:app/router.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final emailAuthControllerProvider = Provider.autoDispose
    .family<EmailAuthController, BuildContext>(EmailAuthController.new);

class EmailAuthController {
  final Ref _ref;
  final BuildContext _context;

  const EmailAuthController(this._ref, this._context);

  Future<void> signUp({
    required String email,
    required String password,
  }) async {
    final result = await _ref
        .read(emailAuthUseCaseProvider)
        .signUp(email: email, password: password);

    if (result && _context.mounted) {
      _context.router.replaceAll([const HomeRoute()]);
    }
  }

  Future<void> signIn({
    required String email,
    required String password,
  }) async {
    final result = await _ref
        .read(emailAuthUseCaseProvider)
        .signIn(email: email, password: password);

    if (result && _context.mounted) {
      _context.router.replaceAll([const HomeRoute()]);
    }
  }
}
