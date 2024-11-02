typedef Validator = String? Function(String? value);

class ValidatorFactory {
  static Validator make(List<ValidatorInterface> validators) {
    return (String? value) {
      for (final validator in validators) {
        final result = validator.validator(value);
        if (result != null) {
          return result;
        }
      }
      return null;
    };
  }
}

abstract interface class ValidatorInterface {
  String? validator(String? value);
}
