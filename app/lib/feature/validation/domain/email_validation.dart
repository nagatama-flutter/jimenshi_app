import 'package:app/feature/validation/domain/validator_factory.dart';

final class EmailValidation implements ValidatorInterface {
  @override
  String? validator(String? value) {
    if (value == null || value.isEmpty) {
      return 'メールアドレスを入力してください';
    }
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    if (!emailRegex.hasMatch(value)) {
      return 'メールアドレスの形式で入力してください';
    }

    return null;
  }
}
