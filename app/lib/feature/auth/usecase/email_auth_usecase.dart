import 'dart:developer';

import 'package:app/feature/auth/usecase/serverpod_auth_usecase.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final emailAuthUseCaseProvider = Provider.autoDispose(EmailSignInUseCase.new);

class EmailSignInUseCase {
  final Ref _ref;

  const EmailSignInUseCase(this._ref);

  Future<bool> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      return _authenticateWithCredential(credential);
    } catch (e) {
      // TODO(iwakaze81): エラーハンドリング
      log(e.toString());
      return false;
    }
  }

  Future<bool> signUp({required String email, required String password}) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      return _authenticateWithCredential(credential);
    } catch (e) {
      // TODO(iwakaze81): エラーハンドリング
      log(e.toString());
      return false;
    }
  }

  Future<bool> _authenticateWithCredential(UserCredential credential) async {
    if (credential.user == null) {
      return false;
    }

    final idToken = await credential.user!.getIdToken();

    if (idToken == null) {
      return false;
    }

    return await _ref
        .read(serverpodAuthUseCaseProvider)
        .authenticateAndUpdateSession(idToken: idToken);
  }
}
