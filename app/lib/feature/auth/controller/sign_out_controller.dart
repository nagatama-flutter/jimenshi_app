import 'package:app/feature/auth/usecase.dart';
import 'package:app/router/app_router.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final signOutControllerProvider = Provider.autoDispose
    .family<SignOutController, BuildContext>(SignOutController.new);

class SignOutController {
  final Ref _ref;
  final BuildContext _context;

  const SignOutController(this._ref, this._context);

  Future<void> signOut() async {
    final result = await _ref.read(signOutUseCaseProvider).signOut();

    if (result && _context.mounted) {
      _context.router.replaceAll([const SignInRoute()]);
    }
  }
}
