import 'package:formz/formz.dart';

enum PasswordError { empty, length, format }

class Password extends FormzInput<String, PasswordError> {
  static final RegExp passwordRegExp = RegExp(
    r'(?:(?=.*\d)|(?=.*\W+))(?![.\n])(?=.*[A-Z])(?=.*[a-z]).*$',
  );

  const Password.pure() : super.pure('');

  const Password.dirty(String value) : super.dirty(value);

  String? get errorMessage {
    if (isValid || isPure) return null;

    if (displayError == PasswordError.empty) {
      return 'The field is required.';
    }

    if (displayError == PasswordError.length) {
      return 'The field must have at least 6 characters.';
    }

    if (displayError == PasswordError.format) {
      return 'The password must have a Uppercase, lowercase letter and a number';
    }

    return null;
  }

  @override
  PasswordError? validator(String value) {
    if (value.isEmpty || value.trim().isEmpty) {
      return PasswordError.empty;
    }

    if (value.length < 6) {
      return PasswordError.length;
    }

    if (!passwordRegExp.hasMatch(value)) {
      return PasswordError.format;
    }

    return null;
  }
}
