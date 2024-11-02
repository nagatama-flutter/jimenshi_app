import 'dart:developer';

import 'package:app/feature/auth/usecase/serverpod_auth_usecase.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final googleAuthUseCaseProvider = Provider.autoDispose(GoogleAuthUseCase.new);

class GoogleAuthUseCase {
  final Ref _ref;

  const GoogleAuthUseCase(this._ref);

  Future<bool> signIn() async {
    try {
      final googleUser = await GoogleSignIn().signIn();

      final googleAuth = await googleUser!.authentication;

      final googleAuthCredential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final credential = await FirebaseAuth.instance.signInWithCredential(
        googleAuthCredential,
      );

      if (credential.user == null) {
        return false;
      }

      // FirebaseのidTokenを取得する(googleAuthのidTokenではない！)
      final idToken = await credential.user!.getIdToken();

      if (idToken == null) {
        return false;
      }

      return _ref
          .read(serverpodAuthUseCaseProvider)
          .authenticateAndUpdateSession(idToken: idToken);
    } catch (e) {
      // TODO(iwakaze81): エラーハンドリング
      log(e.toString());
      return false;
    }
  }
}
