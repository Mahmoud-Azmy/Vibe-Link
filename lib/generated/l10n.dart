// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `VibeLink`
  String get appName {
    return Intl.message('VibeLink', name: 'appName', desc: '', args: []);
  }

  /// `userToken`
  String get userId {
    return Intl.message('userToken', name: 'userId', desc: '', args: []);
  }

  /// `SHARE • INSPIRE • CONNECT`
  String get appTagline {
    return Intl.message(
      'SHARE • INSPIRE • CONNECT',
      name: 'appTagline',
      desc: '',
      args: [],
    );
  }

  /// `Welcome to VibeLink!`
  String get welcomeMessage {
    return Intl.message(
      'Welcome to VibeLink!',
      name: 'welcomeMessage',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get loginButton {
    return Intl.message('Login', name: 'loginButton', desc: '', args: []);
  }

  /// `Sign Up`
  String get signupButton {
    return Intl.message('Sign Up', name: 'signupButton', desc: '', args: []);
  }

  /// `OR LOG IN BY`
  String get orLoginBy {
    return Intl.message('OR LOG IN BY', name: 'orLoginBy', desc: '', args: []);
  }

  /// `Forgot Password?`
  String get forgotPassword {
    return Intl.message(
      'Forgot Password?',
      name: 'forgotPassword',
      desc: '',
      args: [],
    );
  }

  /// `Don't have account? `
  String get noAccount {
    return Intl.message(
      'Don\'t have account? ',
      name: 'noAccount',
      desc: '',
      args: [],
    );
  }

  /// `Already have an account? `
  String get alreadyHaveAccount {
    return Intl.message(
      'Already have an account? ',
      name: 'alreadyHaveAccount',
      desc: '',
      args: [],
    );
  }

  /// `An error occurred. Please try again.`
  String get errorMessage {
    return Intl.message(
      'An error occurred. Please try again.',
      name: 'errorMessage',
      desc: '',
      args: [],
    );
  }

  /// `Operation successful!`
  String get successMessage {
    return Intl.message(
      'Operation successful!',
      name: 'successMessage',
      desc: '',
      args: [],
    );
  }

  /// `Loading...`
  String get loadingMessage {
    return Intl.message(
      'Loading...',
      name: 'loadingMessage',
      desc: '',
      args: [],
    );
  }

  /// `No data available.`
  String get noDataMessage {
    return Intl.message(
      'No data available.',
      name: 'noDataMessage',
      desc: '',
      args: [],
    );
  }

  /// `Login successful`
  String get loginSuccessful {
    return Intl.message(
      'Login successful',
      name: 'loginSuccessful',
      desc: '',
      args: [],
    );
  }

  /// `Signup successful`
  String get signupSuccessful {
    return Intl.message(
      'Signup successful',
      name: 'signupSuccessful',
      desc: '',
      args: [],
    );
  }

  /// `Congratulations, you have signed up successfully!`
  String get signupSuccessMessage {
    return Intl.message(
      'Congratulations, you have signed up successfully!',
      name: 'signupSuccessMessage',
      desc: '',
      args: [],
    );
  }

  /// `A message with verification code was sent to your email.`
  String get verifyCodeMessage {
    return Intl.message(
      'A message with verification code was sent to your email.',
      name: 'verifyCodeMessage',
      desc: '',
      args: [],
    );
  }

  /// `Verification`
  String get verification {
    return Intl.message(
      'Verification',
      name: 'verification',
      desc: '',
      args: [],
    );
  }

  /// `Enter verification code`
  String get verifyCodeHint {
    return Intl.message(
      'Enter verification code',
      name: 'verifyCodeHint',
      desc: '',
      args: [],
    );
  }

  /// `don't receive the code?`
  String get resendCode {
    return Intl.message(
      'don\'t receive the code?',
      name: 'resendCode',
      desc: '',
      args: [],
    );
  }

  /// `Verify`
  String get verifyButton {
    return Intl.message('Verify', name: 'verifyButton', desc: '', args: []);
  }

  /// `Type your email`
  String get typeYourEmail {
    return Intl.message(
      'Type your email',
      name: 'typeYourEmail',
      desc: '',
      args: [],
    );
  }

  /// `We will send you instruction on how to reset your password`
  String get resetPasswordMessage {
    return Intl.message(
      'We will send you instruction on how to reset your password',
      name: 'resetPasswordMessage',
      desc: '',
      args: [],
    );
  }

  /// `Reset Password`
  String get resetPassword {
    return Intl.message(
      'Reset Password',
      name: 'resetPassword',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message('Email', name: 'email', desc: '', args: []);
  }

  /// `Phone Number`
  String get phoneNumber {
    return Intl.message(
      'Phone Number',
      name: 'phoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Enter your password`
  String get passwordHint {
    return Intl.message(
      'Enter your password',
      name: 'passwordHint',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get name {
    return Intl.message('Name', name: 'name', desc: '', args: []);
  }

  /// `Password`
  String get password {
    return Intl.message('Password', name: 'password', desc: '', args: []);
  }

  /// `Send`
  String get send {
    return Intl.message('Send', name: 'send', desc: '', args: []);
  }

  /// `Got it`
  String get gotIt {
    return Intl.message('Got it', name: 'gotIt', desc: '', args: []);
  }

  /// `Confirm Password`
  String get confirmPassword {
    return Intl.message(
      'Confirm Password',
      name: 'confirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `Set New Password`
  String get setNewPassword {
    return Intl.message(
      'Set New Password',
      name: 'setNewPassword',
      desc: '',
      args: [],
    );
  }

  /// `Type your new password`
  String get typeYourNewPassword {
    return Intl.message(
      'Type your new password',
      name: 'typeYourNewPassword',
      desc: '',
      args: [],
    );
  }

  /// `Check Verification`
  String get checkVerification {
    return Intl.message(
      'Check Verification',
      name: 'checkVerification',
      desc: '',
      args: [],
    );
  }

  /// `Complete Registration`
  String get completeRegistration {
    return Intl.message(
      'Complete Registration',
      name: 'completeRegistration',
      desc: '',
      args: [],
    );
  }

  /// `Not verified yet`
  String get notVerified {
    return Intl.message(
      'Not verified yet',
      name: 'notVerified',
      desc: '',
      args: [],
    );
  }

  /// `Email is verified`
  String get verified {
    return Intl.message(
      'Email is verified',
      name: 'verified',
      desc: '',
      args: [],
    );
  }

  /// `Email is verified successfully!`
  String get verifiedMessage {
    return Intl.message(
      'Email is verified successfully!',
      name: 'verifiedMessage',
      desc: '',
      args: [],
    );
  }

  /// `Please verify your email address to complete the registration.`
  String get notVerifiedMessage {
    return Intl.message(
      'Please verify your email address to complete the registration.',
      name: 'notVerifiedMessage',
      desc: '',
      args: [],
    );
  }

  /// `Go to Verification`
  String get goToVerification {
    return Intl.message(
      'Go to Verification',
      name: 'goToVerification',
      desc: '',
      args: [],
    );
  }

  /// `Go to Home`
  String get goToHome {
    return Intl.message('Go to Home', name: 'goToHome', desc: '', args: []);
  }

  /// `Verification email resent`
  String get verificationEmailSent {
    return Intl.message(
      'Verification email resent',
      name: 'verificationEmailSent',
      desc: '',
      args: [],
    );
  }

  /// `User created successfully`
  String get userCreated {
    return Intl.message(
      'User created successfully',
      name: 'userCreated',
      desc: '',
      args: [],
    );
  }

  /// `User created successfully! You can now log in.`
  String get userCreatedMessage {
    return Intl.message(
      'User created successfully! You can now log in.',
      name: 'userCreatedMessage',
      desc: '',
      args: [],
    );
  }

  /// `An email with instructions to reset your password has been sent.`
  String get emailResetSentMessage {
    return Intl.message(
      'An email with instructions to reset your password has been sent.',
      name: 'emailResetSentMessage',
      desc: '',
      args: [],
    );
  }

  /// `Email Reset Sent`
  String get emailResetSent {
    return Intl.message(
      'Email Reset Sent',
      name: 'emailResetSent',
      desc: '',
      args: [],
    );
  }

  /// `What's on your mind?`
  String get whatIsOnYourMind {
    return Intl.message(
      'What\'s on your mind?',
      name: 'whatIsOnYourMind',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
