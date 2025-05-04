import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:vibe_link/core/components/gradient_text.dart';
import 'package:vibe_link/core/theme/app_colors.dart';
import 'package:vibe_link/core/theme/app_text_style.dart';
import 'package:vibe_link/core/utils/app_assets.dart';
import 'package:vibe_link/core/utils/app_router.dart';
import 'package:vibe_link/core/utils/app_strings.dart';
import 'package:vibe_link/core/utils/validators.dart';
import 'package:vibe_link/features/auth/presentation/widgets/custom_button.dart';
import 'package:vibe_link/features/auth/presentation/widgets/custom_container_message.dart';
import 'package:vibe_link/features/auth/presentation/widgets/custom_text_form_field.dart';
import 'package:vibe_link/features/auth/presentation/widgets/three_overlapping_squares.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.4,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(AppAssets.welcome),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.4,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.blue.withAlpha(77),
                    Colors.purple.withAlpha(77),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 100.h,
              left: 0,
              right: 0,
              child: Center(
                child: Text(
                  AppStrings.appName,
                  style: AppTextStyles.font24Bold,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.7,
                padding: EdgeInsets.only(left: 30.w, right: 30.w, top: 30.h),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GradientText(
                          colors: AppColors.buttonsColor,
                          text: AppStrings.typeYourEmail.toUpperCase(),
                          textStyle: AppTextStyles.font18Bold,
                        ),
                        SizedBox(height: 16.h),
                        CustomContainerMessage(
                          message: AppStrings.typeYourEmail,
                        ),
                        SizedBox(height: 40.h),
                        CustomTextFormField(
                          hintText: AppStrings.email,
                          controller: _controller,
                          validator: (value) {
                            return Validators.validateVerifyCode(value);
                          },
                        ),
                        SizedBox(height: 20.h),
                        CustomButton(
                          text: AppStrings.send.toUpperCase(),
                          onPressed: () {
                            GoRouter.of(context).push(AppRouter.setNewPassword);
                          },
                        ),
                        SizedBox(height: 40.h),
                        ThreeOverlappingSquares(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
