import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void showSuccessDialog({
  required BuildContext context,
  required String userId,
  required String email,
  required String name,
  required String route,
  required String message,
  required String title,
}) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title),
        content: SingleChildScrollView(
          child: ListBody(children: <Widget>[Text(message)]),
        ),
        actions: <Widget>[
          TextButton(
            style: TextButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.blue,
              disabledForegroundColor: Colors.grey.withOpacity(0.38),
            ),
            onPressed: () {
              GoRouter.of(context).go(
                route,
                extra: {'userId': userId, 'email': email, 'name': name},
              );
            },
            child: const Text('Go to Verification'),
          ),
        ],
      );
    },
  );
}
