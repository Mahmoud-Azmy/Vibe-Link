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
    required this.validator,
    this.isObscured,
    this.hintText,
    this.suffixIcon,
    this.textAlign,
  });

  final bool isPassword;
  final TextInputType? keyboardType;
  final TextEditingController controller;
  final void Function(String?)? onChanged;
  final Function(String?) validator;
  final bool? isObscured;
  final String? hintText;
  final Widget? suffixIcon;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textAlign: textAlign ?? TextAlign.start,
      controller: controller,
      keyboardType: keyboardType,
      obscureText: isObscured ?? false,
      onSaved: onChanged,
      validator: (value) {
        return validator(value);
      },
      decoration: InputDecoration(
        isDense: true,
        contentPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
        hintText: hintText,
        alignLabelWithHint: true,
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
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.r),
          borderSide: BorderSide(width: 0, color: Colors.white),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.r),
          borderSide: BorderSide(width: 0, color: Colors.white),
        ),
      ),
    );
  }
}
