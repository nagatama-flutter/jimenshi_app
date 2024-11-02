import 'package:app/feature/validation/domain/validator_factory.dart';

final class RequiredValidation implements ValidatorInterface {
  @override
  String? validator(String? value) {
    if (value == null || value.isEmpty) {
      return '必須項目です';
    }

    return null;
  }
}
