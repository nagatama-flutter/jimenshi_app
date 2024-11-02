import 'package:app/data.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final serverpodAuthUseCaseProvider =
    Provider.autoDispose((ref) => ServerpodAuthUseCase(ref));

class ServerpodAuthUseCase {
  final Ref _ref;

  const ServerpodAuthUseCase(this._ref);

  Future<bool> authenticateAndUpdateSession({required String idToken}) async {
    final response = await _ref
        .read(serverpodClientProvider)
        .modules
        .auth
        .firebase
        .authenticate(idToken);

    final userInfo = response.userInfo;
    final authenticationKeyId = response.keyId;
    final authenticationKey = response.key;

    if (response.success &&
        userInfo != null &&
        authenticationKeyId != null &&
        authenticationKey != null) {
      await _ref.read(serverpodSessionManagerProvider).registerSignedInUser(
          userInfo, authenticationKeyId, authenticationKey);

      return true;
    }

    return false;
  }
}
