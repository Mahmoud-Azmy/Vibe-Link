import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:vibe_link/core/components/gradient_text.dart';
import 'package:vibe_link/core/di/dependency_injection.dart';
import 'package:vibe_link/core/theme/app_colors.dart';
import 'package:vibe_link/core/theme/app_text_style.dart';
import 'package:vibe_link/core/utils/app_assets.dart';
import 'package:vibe_link/core/utils/app_router.dart';
import 'package:vibe_link/core/utils/app_strings.dart';
import 'package:vibe_link/features/auth/data/repos/auth_repo.dart';
import 'package:vibe_link/features/auth/presentation/controllers/Verification/verification_cubit.dart';
import 'package:vibe_link/features/auth/presentation/controllers/Verification/verification_state.dart';
import 'package:vibe_link/features/auth/presentation/widgets/custom_button.dart';
import 'package:vibe_link/features/auth/presentation/widgets/custom_container_message.dart';
import 'package:vibe_link/features/auth/presentation/widgets/three_overlapping_squares.dart';

class VerificationScreen extends StatelessWidget {
  final String userId;
  final String email;
  final String name;

  const VerificationScreen({
    super.key,
    required this.userId,
    required this.email,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
        create: (context) => VerificationCubit(sl<AuthRepo>()),
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
                    child: VerifictionBlocConsumer(name: name, email: email, userId: userId),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class VerifictionBlocConsumer extends StatelessWidget {
  const VerifictionBlocConsumer({
    super.key,
    required this.name,
    required this.email,
    required this.userId,
  });

  final String name;
  final String email;
  final String userId;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<VerificationCubit, VerificationState>(
      listener: (context, state) {
        if (state is UserCreated) {
          GoRouter.of(context).go(AppRouter.homeView);
        }
      },
      builder: (context, state) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GradientText(
              colors: AppColors.buttonsColor,
              text: AppStrings.verification.toUpperCase(),
              textStyle: AppTextStyles.font18Bold,
            ),
            SizedBox(height: 16.h),
            CustomContainerMessage(
              message: AppStrings.verifyCodeMessage,
            ),
            SizedBox(height: 40.h),
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
              text: AppStrings.checkVerification.toUpperCase(),
              onPressed: () {
                context
                    .read<VerificationCubit>()
                    .checkEmailVerification();
              },
              child:
                  state is Loading
                      ? Center(
                        child: const CircularProgressIndicator(
                          color: Colors.white,
                        ),
                      )
                      : null,
            ),
            SizedBox(height: 20.h),
            if (state is Verified)
              CustomButton(
                text: AppStrings.completeRegistration,
                onPressed: () {
                  context
                      .read<VerificationCubit>()
                      .createVerifiedUser(
                        name: name,
                        email: email,
                        uId: userId,
                      );
                },
              ),
            SizedBox(height: 40.h),
            ThreeOverlappingSquares(),
          ],
        );
      },
    );
  }
}
