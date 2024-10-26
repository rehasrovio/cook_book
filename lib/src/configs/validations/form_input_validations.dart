import 'dart:core';
import 'package:cook_book/src/configs/validations/common_regex_patterns.dart';

typedef ValidationFunction = String? Function(String? value);

ValidationFunction composeValidations(List<ValidationFunction> validators) {
  return (String? value) {
    if (validators.isEmpty) {
      return null;
    }
    String? result;
    for (final validator in validators) {
      result = validator(value);
      if (result != null) {
        return result;
      }
    }

    return null;
  };
}

ValidationFunction validateIsAlphanumeric({String? errorMessage}) {
  return (String? value) {
    final isValidName =
        RegExp(RegexPatterns.alphanumericRegExp).hasMatch(value!);

    if (!isValidName) {
      return errorMessage ?? 'Device ID must be alphanumeric';
    }

    return null;
  };
}

ValidationFunction validateRequired({String? errorMessage = 'Required'}) =>
    (String? value) =>
        (value != null && value.trim().isNotEmpty) ? null : errorMessage;

ValidationFunction validateMinLength({
  required int minLength,
  String? errorMessage,
}) =>
    (String? value) => value == null || value.trim().length >= minLength
        ? null
        : errorMessage ?? 'Cannot be less than $minLength characters';

ValidationFunction validateMaxLength({
  required int maxLength,
  String? errorMessage,
}) {
  return (String? value) => value != null && value.length > maxLength
      ? errorMessage ?? 'Cannot be more than $maxLength characters'
      : null;
}

ValidationFunction validateOnlyAlphabets({String? errorMessage}) {
  return (String? value) {
    final isValidName = RegExp(RegexPatterns.alphabetsPattern).hasMatch(value!);

    if (!isValidName) {
      return errorMessage ?? 'Name must be only of letters';
    }

    return null;
  };
}

ValidationFunction validateEmail({String? errorMessage}) {
  return (String? value) {
    final isValidEmail = RegExp(RegexPatterns.emailPattern).hasMatch(value!);

    if (!isValidEmail) {
      return errorMessage ?? 'Email must be valid';
    }

    return null;
  };
}

ValidationFunction validatePassword({String? errorMessage}) {
  return (String? value) {
    final isValidPassword =
        RegExp(RegexPatterns.passwordPattern).hasMatch(value!);

    if (!isValidPassword) {
      return errorMessage ??
          '''
- A minimum length of 8 characters
- A uppercase letter
- A lowercase letter
- A digit
- A special character
 ''';
    }

    return null;
  };
}

ValidationFunction validateConfirmPassword({
  required String currentPassword,
  String? errorMessage,
}) {
  return (String? value) => value != currentPassword
      ? errorMessage ?? 'Must match the current password'
      : null;
}

ValidationFunction validateDateOfBirth({String? errorMessage}) {
  return (String? value) {
    if (value == null || value.isEmpty) {
      return errorMessage ?? 'Date of Birth is required';
    }

    final dateRegex = RegExp(RegexPatterns.dateOfBirthPattern).hasMatch(value);

    if (!dateRegex) {
      return errorMessage ?? 'Invalid Date of Birth MM/DD/YYYY';
    }

    try {
      final parts = value.split('/');
      final month = int.parse(parts[0]);
      final day = int.parse(parts[1]);
      final year = int.parse(parts[2]);

      final dob = DateTime(year, month, day);
      final today = DateTime.now();

      if (dob.isAfter(today)) {
        return errorMessage ?? 'Date of Birth cannot be in the future';
      }
      if (dob.isBefore(DateTime(1900))) {
        return errorMessage ?? 'Date of Birth invalid';
      }

      return null;
    } catch (e) {
      return errorMessage ?? 'Invalid Date of Birth MM/DD/YYYY';
    }
  };
}
