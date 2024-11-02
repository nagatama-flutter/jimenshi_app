import 'package:app/feature/validation/domain/validator_factory.dart';

final class PasswordValidation implements ValidatorInterface {
  @override
  String? validator(String? value) {
    if (value == null || value.isEmpty) {
      return 'パスワードを入力してください';
    }
    if (value.length < 8) {
      return 'パスワードは8文字以上で入力してください';
    }

    if (value.length > 4096) {
      return 'パスワードは4096文字以下で入力してください';
    }

    final hasLowercase = value.contains(RegExp(r'[a-z]'));
    final hasDigit = value.contains(RegExp(r'\d'));

    if (!hasLowercase || !hasDigit) {
      return 'パスワードには小文字と数字を含めてください';
    }

    return null;
  }
}
