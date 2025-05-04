import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vibe_link/core/utils/app_assets.dart';
import 'package:vibe_link/core/utils/app_strings.dart';
import 'package:vibe_link/core/utils/validators.dart';
import 'package:vibe_link/features/auth/presentation/widgets/custom_text_form_field.dart';

class SetNewPasswordUserInput extends StatefulWidget {
  const SetNewPasswordUserInput({super.key});

  @override
  State<SetNewPasswordUserInput> createState() =>
      _SetNewPasswordUserInputState();
}

class _SetNewPasswordUserInputState extends State<SetNewPasswordUserInput> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _controller = TextEditingController();
  final TextEditingController _confirmController = TextEditingController();
  bool isPasswordObscured = false;
  bool isConfirmPasswordObscured = false;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          CustomTextFormField(
            suffixIcon: IconButton(
              icon: SvgPicture.asset(
                isPasswordObscured ? AppAssets.hide : AppAssets.show,
                height: 20,
                width: 20,
              ),
              onPressed: () {
                setState(() {
                  isPasswordObscured = !isPasswordObscured;
                });
              },
            ),
            isObscured: isPasswordObscured,
            controller: _controller,
            hintText: AppStrings.password,
            isPassword: true,
            validator: (value) {
              return Validators.validatePassword(value);
            },
          ),
          SizedBox(height: 20.h),
          CustomTextFormField(
            isObscured: isConfirmPasswordObscured,
            suffixIcon: IconButton(
              icon: SvgPicture.asset(
                isConfirmPasswordObscured ? AppAssets.hide : AppAssets.show,
                height: 20,
                width: 20,
              ),
              onPressed: () {
                setState(() {
                  isConfirmPasswordObscured = !isConfirmPasswordObscured;
                });
              },
            ),
            controller: _confirmController,
            hintText: AppStrings.confirmPassword,
            isPassword: true,
            validator: (value) {
              return Validators.validatePassword(value);
            },
          ),
        ],
      ),
    );
  }
}
