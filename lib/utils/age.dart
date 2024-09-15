import 'package:formz/formz.dart';

enum AgeValidationError {
  invalid('age should be between 18 and 99'),
  empty('empty');

  const AgeValidationError(this.value);

  final String value;
}

class Age extends FormzInput<String, String> {
  const Age.pure() : super.pure('');
  const Age.dirty([super.value = '']) : super.dirty();

  static final _numberRegExp = RegExp(r'^\d+$');

  @override
  String? validator(String value) {
    if (value.isEmpty) {
      return AgeValidationError.empty.value;
    }
    return _numberRegExp.hasMatch(value) &&
            int.parse(value) >= 18 &&
            int.parse(value) <= 99
        ? null
        : AgeValidationError.invalid.value;
  }
}
