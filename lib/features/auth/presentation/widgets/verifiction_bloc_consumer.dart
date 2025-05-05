import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:vibe_link/core/components/gradient_text.dart';
import 'package:vibe_link/core/functions/error_dialog.dart';
import 'package:vibe_link/core/functions/success_dialog.dart';
import 'package:vibe_link/core/theme/app_colors.dart';
import 'package:vibe_link/core/theme/app_text_style.dart';
import 'package:vibe_link/core/utils/app_router.dart';
import 'package:vibe_link/core/utils/app_strings.dart';
import 'package:vibe_link/features/auth/presentation/controllers/Verification/verification_cubit.dart';
import 'package:vibe_link/features/auth/presentation/controllers/Verification/verification_state.dart';
import 'package:vibe_link/features/auth/presentation/widgets/custom_button.dart';
import 'package:vibe_link/features/auth/presentation/widgets/custom_container_message.dart';
import 'package:vibe_link/features/auth/presentation/widgets/three_overlapping_squares.dart';

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
        } else if (state is EmailResent) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text(AppStrings.verificationEmailSent)),
          );
        } else if (state is Error) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
        } else if (state is VerificationCheckFailed) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
        } else if (state is Verified) {
          showSuccessDialog(
            context: context,
            userId: userId,
            email: email,
            name: name,
            message: AppStrings.verifiedMessage,
            title: AppStrings.verified,
            buttonTitle: AppStrings.gotIt,
          );
        } else if (state is Unverified) {
          errorDialog(context, AppStrings.notVerified);
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
            CustomContainerMessage(message: AppStrings.verifyCodeMessage),
            SizedBox(height: 40.h),
            // Resend Code Text
            TextButton(
              onPressed: () {
                context.read<VerificationCubit>().resendVerificationEmail();
              },
              child: Text(
                AppStrings.resendCode.toUpperCase(),
                style: AppTextStyles.font14Grey,
              ),
            ),
            SizedBox(height: 20.h),
            CustomButton(
              text: AppStrings.checkVerification.toUpperCase(),
              onPressed: () {
                context.read<VerificationCubit>().checkEmailVerification();
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
                  context.read<VerificationCubit>().createVerifiedUser(
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
