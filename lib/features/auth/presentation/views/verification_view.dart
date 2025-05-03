import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vibe_link/core/components/gradient_text.dart';
import 'package:vibe_link/core/theme/app_colors.dart';
import 'package:vibe_link/core/theme/app_text_style.dart';
import 'package:vibe_link/core/utils/app_assets.dart';
import 'package:vibe_link/core/utils/app_strings.dart';
import 'package:vibe_link/core/utils/validators.dart';
import 'package:vibe_link/features/auth/presentation/widgets/custom_button.dart';
import 'package:vibe_link/features/auth/presentation/widgets/custom_text_form_field.dart';
import 'package:vibe_link/features/auth/presentation/widgets/three_overlapping_squares.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({super.key});

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
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
                          text: AppStrings.verification.toUpperCase(),
                          textStyle: AppTextStyles.font18Bold,
                        ),
                        SizedBox(height: 16.h),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: AppColors.primarBackground,
                          ),
                          padding: EdgeInsets.all(16.h),
                          child: Text(
                            AppStrings.verifyCodeMessage,
                            style: AppTextStyles.font16,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SizedBox(height: 40.h),
                        CustomTextFormField(
                          hintText: AppStrings.verifyCodeHint,
                          textAlign: TextAlign.center,
                          controller: _controller,
                          validator: (value) {
                            return Validators.validateVerifyCode(value);
                          },
                        ),
                        // Resend Code Text
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            AppStrings.resendCode.toUpperCase(),
                            style: AppTextStyles.font14Grey,
                          ),
                        ),
                        SizedBox(height: 20.h),
                        CustomButton(
                          text: AppStrings.verifyButton.toUpperCase(),
                          onPressed: () {},
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
