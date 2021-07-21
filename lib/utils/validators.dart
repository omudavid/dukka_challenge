import 'package:get/get_utils/src/get_utils/get_utils.dart';

class Validator {
  static String? isEmail(String value) {
    if (GetUtils.isEmail(value.trim())) {
      return null;
    }
    return 'Please enter a valid email';
  }

  static String? isName(String value) {
    if (value.isEmpty) {
      return 'This field is required';
    } else if (!GetUtils.isAlphabetOnly(value) || value.length < 2) {
      return 'Please enter a valid name';
    }
    return null;
  }

  static String? isNotEmpty(String value) {
    if (value.isEmpty) {
      return 'This field is required';
    }
    return null;
  }

  static String? isPhoneNumber(String value) {
    if (!GetUtils.isNumericOnly(value)) {
      return 'Phone must be only digits';
    }

    if (value.isEmpty || value.length < 11) {
      return 'Phone number must be 11 digits long';
    }
    return null;
  }

  static String? isSalary(String value) {
    if (value.isEmpty) {
      return 'Field Is Required';
    }

    if (!GetUtils.isNumericOnly(value)) {
      return 'Salary must be only digits';
    }
    return null;
  }
}
