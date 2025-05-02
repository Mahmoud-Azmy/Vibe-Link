import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vibe_link/core/theme/app_colors.dart';
import 'package:vibe_link/core/theme/app_text_style.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.isPassword = false,
    this.keyboardType,
    required this.controller,
    this.onChanged,
    this.validator,
    this.isObscured,
    this.hintText,
    this.suffixIcon,
  });

  final bool isPassword;
  final TextInputType? keyboardType;
  final TextEditingController controller;
  final void Function(String?)? onChanged;
  final String? Function(String?)? validator;
  final bool? isObscured;
  final String? hintText;
  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      obscureText: isObscured ?? false,
      onSaved: onChanged,
      validator: validator,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
        hintText: hintText,
        hintStyle: AppTextStyles.font16Placeholder,
        suffixIcon: suffixIcon,
        fillColor: AppColors.fieldBackground,
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.r),
          borderSide: BorderSide(width: 0, color: Colors.white),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.r),
          borderSide: BorderSide(width: 0, color: Colors.white),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.r),
          borderSide: BorderSide(width: 0, color: Colors.white),
        ),
      ),
    );
  }
}
