import '../constants/app_constants.dart';

class Validators {
  static String? validateEmail(String? value) {
    if (value == null ||
        !RegExp(AppConstants.validationEmail).hasMatch(value)) {
      return 'Invalid email';
    }
    return null;
  }

  static String? validateName(String? value) {
    if (value == null ||
        value.length <= 2 ||
        !RegExp(AppConstants.validationName).hasMatch(value)) {
      return 'Enter valid name';
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.length < 6) {
      return 'Password should be longer or equal to 6 characters';
    }
    return null;
  }
}
