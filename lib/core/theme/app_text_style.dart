import 'package:flutter/material.dart';
import 'package:vibe_link/core/theme/app_colors.dart';

class AppTextStyles {
  static const heading = TextStyle(fontSize: 24, fontWeight: FontWeight.bold);
  static const body = TextStyle(fontSize: 16, fontWeight: FontWeight.normal);
  static const font40Bold = TextStyle(
    fontSize: 40,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  static const font14Grey = TextStyle(
    fontFamily: 'CircularStd',
    color: Colors.grey,
    fontSize: 14,
  );

  static final font14Bold = TextStyle(
    fontFamily: 'CircularStd',
    color: Colors.blue[900],
    fontSize: 14,
    fontWeight: FontWeight.bold,
  );
  static const font16Bold = TextStyle(
    fontFamily: 'CircularStd',
    fontWeight: FontWeight.bold,
    fontSize: 16,
  );
  static const font24Bold = TextStyle(
    fontFamily: 'CircularStd',
    fontWeight: FontWeight.bold,
    fontSize: 24,
    color: Colors.white,
  );
  static const font16Placeholder = TextStyle(
    fontFamily: 'CircularStd',
    fontSize: 16,
    color: AppColors.placeholder,
  );
  static const font18Bold = TextStyle(
    fontFamily: 'CircularStd',
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );
  static const font16 = TextStyle(fontSize: 18, fontWeight: FontWeight.w400);
}
