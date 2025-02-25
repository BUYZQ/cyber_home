import 'dart:developer';

import 'package:email_validator/email_validator.dart';

class Validators {
  static String? validateEmpty(String? value) {
    if (value == null || value.isEmpty) {
      return 'Поле не может быть пустым';
    }
    return null;
  }

  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Поле не может быть пустым';
    } else if (!EmailValidator.validate(value)) {
      return 'Неправильный формат email';
    }
    return null;
  }

  static String? validatePasswordComplexity(String? value) {
    if (value == null || value.isEmpty) {
      return 'Поле не может быть пустым';
    } else if (value.length < 8) {
      return 'Пароль должен быть не менее 8 символов';
    } else if (!RegExp(r'[a-zA-Z]').hasMatch(value!)) {
      return 'Пароль должен содержать буквы';
    } else if (!RegExp(r'[0-9]').hasMatch(value)) {
      return 'Пароль должен содержать цифры';
    }
    return null;
  }

  static String? validatePasswordComplexityAndConfirm(String? value, String password, String confirmPassword) {
    if (value == null || value.isEmpty) {
      return 'Поле не может быть пустым';
    } else if(value != password || value != confirmPassword) {
      return 'Пароли не совпадают';
    } else if (value.length < 8) {
      return 'Пароль должен быть не менее 8 символов';
    } else if (!RegExp(r'[a-zA-Z]').hasMatch(value!)) {
      return 'Пароль должен содержать буквы';
    } else if (!RegExp(r'[0-9]').hasMatch(value)) {
      return 'Пароль должен содержать хотя цифры';
    }
    log(password);
    log(confirmPassword);
    return null;
  }
}
