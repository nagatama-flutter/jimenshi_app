import 'package:app/data.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final signOutUseCaseProvider = Provider.autoDispose(SignOutUseCase.new);

class SignOutUseCase {
  final Ref _ref;

  const SignOutUseCase(this._ref);

  Future<bool> signOut() async {
    try {
      await FirebaseAuth.instance.signOut();

      return _ref.read(serverpodSessionManagerProvider).signOut();
    } catch (e) {
      // TODO(iwakaze81): エラーハンドリング
      return false;
    }
  }
}
