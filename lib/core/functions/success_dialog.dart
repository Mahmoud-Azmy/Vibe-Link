import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:vibe_link/core/theme/app_colors.dart';

void showSuccessDialog({
  required BuildContext context,
  required String userId,
  required String email,
  required String name,
   String? route,
  required String message,
  required String title,
  required String buttonTitle,
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
          Container(
            height: 45.h,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: AppColors.buttonsColor,
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
              borderRadius: BorderRadius.circular(30),
            ),
            child: ElevatedButton(
              onPressed: () {
                if (route == null) {
                  Navigator.of(context).pop();
                  return;
                }
                GoRouter.of(context).go(
                  route,
                  extra: {'userId': userId, 'email': email, 'name': name},
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                shadowColor: Colors.transparent,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Text(buttonTitle),
            ),
          ),
          // TextButton(
          //   style: TextButton.styleFrom(
          //     foregroundColor: Colors.white,
          //     backgroundColor: Colors.blue,
          //     disabledForegroundColor: Colors.grey.withOpacity(0.38),
          //   ),
          //   onPressed: () {
          //     GoRouter.of(context).go(
          //       route,
          //       extra: {'userId': userId, 'email': email, 'name': name},
          //     );
          //   },
          //   child:  Text(buttonTitle),
          // ),
        ],
      );
    },
  );
}
