import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vibe_link/core/theme/app_colors.dart';
import 'package:vibe_link/core/theme/app_text_style.dart';

class CustomContainerMessage extends StatelessWidget {
  const CustomContainerMessage({super.key, required this.message});
  final String message;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: AppColors.primarBackground,
      ),
      padding: EdgeInsets.all(16.h),
      child: Text(
        message,
        style: AppTextStyles.font16,
        textAlign: TextAlign.center,
      ),
    );
  }
}
