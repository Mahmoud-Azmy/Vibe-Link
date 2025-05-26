import 'package:flutter/material.dart';
import 'package:vibe_link/generated/l10n.dart';

abstract class Validators {
  static String? validateEmail(String? value, BuildContext context) {
    if (value == null || value.trim().isEmpty) {
      return S.of(context).emailValidationEmpty;
    }
    final trimmedValue = value.trim();
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,}$');
    if (!emailRegex.hasMatch(trimmedValue)) {
      return S.of(context).emailValidationInvalid;
    }
    return null;
  }

  static String? validatePassword(String? value, BuildContext context) {
    if (value == null || value.isEmpty) {
      return S.of(context).passwordValidationEmpty;
    }
    if (value.length < 6) {
      return S.of(context).passwordValidationLength;
    }
    if (!value.contains(RegExp(r'[A-Z]'))) {
      return S.of(context).passwordValidationUppercase;
    }
    if (!value.contains(RegExp(r'[0-9]'))) {
      return S.of(context).passwordValidationNumber;
    }
    return null;
  }

  static String? validateUsername(String? value, BuildContext context) {
    if (value == null || value.isEmpty) {
      return S.of(context).usernameValidationEmpty;
    }
    if (value.length < 3) {
      return S.of(context).usernameValidationLength;
    }
    return null;
  }

  static String? validateVerifyCode(String? value, BuildContext context) {
    if (value == null || value.isEmpty) {
      return S.of(context).verifyCodeValidationEmpty;
    }
    if (value.length != 6) {
      return S.of(context).verifyCodeValidationLength;
    }
    return null;
  }
}
