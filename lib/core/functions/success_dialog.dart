import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:vibe_link/core/utils/app_router.dart';
import 'package:vibe_link/core/utils/app_strings.dart';

void showSuccessDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Signup Successful'),
        content: const SingleChildScrollView(
          child: ListBody(
            children: <Widget>[Text(AppStrings.signupSuccessMessage)],
          ),
        ),
        actions: <Widget>[
          TextButton(
            style: TextButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.blue,
              disabledForegroundColor: Colors.grey.withOpacity(0.38),
            ),
            onPressed: () {
              GoRouter.of(context).go(AppRouter.verification);
            },
            child: const Text('Continue'),
          ),
        ],
      );
    },
  );
}
