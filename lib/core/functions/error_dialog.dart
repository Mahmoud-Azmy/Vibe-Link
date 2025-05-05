import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:vibe_link/core/components/gradient_text.dart';
import 'package:vibe_link/core/theme/app_colors.dart';
import 'package:vibe_link/core/utils/app_strings.dart';

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
              child: GradientText(
                textStyle: TextStyle(fontSize: 16, color: Colors.white),
                text: AppStrings.gotIt,
                colors: AppColors.buttonsColor,
              ),
            ),
          ],
        ),
  );
}
