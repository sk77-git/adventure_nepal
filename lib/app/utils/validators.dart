import 'extensions.dart';

class Validator {
  static String? validatePassword({required String? string}) {
    if (string.isNullOrEmpty) {
      return "* Required";
    } else if (string.toString().length < 6) {
      return "Password should be at least 6 characters";
    } else if (string.toString().length > 15) {
      return "Password should not be greater than 15 characters";
    } else {
      return null;
    }
  }

  static String? confirmPassword(
      {required String password, required String cPassword}) {
    if (password == cPassword) {
      return null;
    } else {
      return "Passwords do not match.";
    }
  }

  /// email validator
  static String? validateEmail({required String? string}) {
    String regex =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    if (string.isNullOrEmpty) return "* Required";
    if (!validRegexExp(regex, string ?? "")) {
      return "Invalid Email";
    } else {
      return null;
    }
  }

  static String? validatePhone({required String string}) {
    if (string.isEmpty) {
      return "* Required";
    } else if (string.length < 6) {
      return "Phone should be atleast 6 characters";
    } else if (string.length > 10) {
      return "Phone should not be greater than 10 characters";
    } else {
      return null;
    }
  }

  /// validate min length
  static String? validateMinLength(
      {required String string, required int length}) {
    return (string.length < length && string.isEmpty)
        ? "It must be greate than $length characters"
        : null;
  }

  /// validate max length
  static String? validateMaxLength({required String string, int length = 4}) {
    return string.length > length
        ? "It must not exceed $length characters"
        : null;
  }

  /// validate empty string
  static String? validateIsEmpty({required String? string}) {
    return string.isNullOrEmpty ? "* Required" : null;
  }

  static String? validateNothing({required String string}) {
    return string.isEmpty ? null : null;
  }

  /// validate min-max length
  static String? validateMinMaxLength(
      {required String string, int minLegth = 1, int maxLength = 10}) {
    return (string.length < minLegth || string.length > maxLength)
        ? "It must be between $minLegth and $maxLength characters"
        : null;
  }

  /// validate min-max length with regex
  static String? validateMinMaxLengthWithRegex(
      {required String string,
      int minLength = 1,
      int maxLength = 10,
      required String regex,
      String regexMessage = "Invalid data"}) {
    if (string.length < minLength || string.length > maxLength) {
      return "It must be between $minLength and $maxLength characters";
    } else if (!validRegexExp(regex, string)) {
      return regexMessage;
    } else {
      return null;
    }
  }

  /// validate regex for the string
  static bool validRegexExp(String regex, String string) {
    return RegExp(regex).hasMatch(string);
  }
}
