import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void errorDialog(BuildContext context, String error) {
  showDialog(
    context: context,
    builder:
        (context) => AlertDialog(
          icon: const Icon(Icons.error, color: Colors.red, size: 32),
          content: Text(error, style: const TextStyle(fontSize: 16)),
          actions: [
            TextButton(
              onPressed: () {
                context.pop();
              },
              child: Text(
                'Got it',
                style: const TextStyle(fontSize: 16, color: Colors.blue),
              ),
            ),
          ],
        ),
  );
}
