import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vibe_link/core/components/custom_button.dart';
import 'package:vibe_link/core/components/gradient_text.dart';
import 'package:vibe_link/core/functions/error_dialog.dart';
import 'package:vibe_link/core/functions/success_dialog.dart';
import 'package:vibe_link/core/theme/app_colors.dart';
import 'package:vibe_link/core/theme/app_text_style.dart';
import 'package:vibe_link/core/utils/app_router.dart';
import 'package:vibe_link/features/auth/presentation/controllers/verification/verification_cubit.dart';
import 'package:vibe_link/features/auth/presentation/controllers/verification/verification_state.dart';
import 'package:vibe_link/features/auth/presentation/widgets/custom_container_message.dart';
import 'package:vibe_link/features/auth/presentation/widgets/three_overlapping_squares.dart';
import 'package:vibe_link/generated/l10n.dart';

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
          showSuccessDialog(
            context: context,
            userId: userId,
            email: email,
            name: name,
            route: AppRouter.homeView,
            message: S.of(context).userCreatedMessage,
            title: S.of(context).userCreated,
            buttonTitle: S.of(context).goToHome,
          );
        } else if (state is EmailResent) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(S.of(context).verificationEmailSent)),
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
            message: S.of(context).verifiedMessage,
            title: S.of(context).verified,
            buttonTitle: S.of(context).gotIt,
          );
        } else if (state is Unverified) {
          errorDialog(context, S.of(context).notVerified);
        }
      },
      builder: (context, state) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GradientText(
              colors: AppColors.buttonsColor,
              text: S.of(context).verification.toUpperCase(),
              textStyle: AppTextStyles.font18Bold,
            ),
            SizedBox(height: 16.h),
            CustomContainerMessage(message: S.of(context).verifyCodeMessage),
            SizedBox(height: 40.h),
            // Resend Code Text
            TextButton(
              onPressed: () {
                context.read<VerificationCubit>().resendVerificationEmail();
              },
              child: Text(
                S.of(context).resendCode.toUpperCase(),
                style: AppTextStyles.font14Grey,
              ),
            ),
            SizedBox(height: 20.h),
            CustomButton(
              text:
                  state is Verified
                      ? S.of(context).completeRegistration
                      : S.of(context).checkVerification.toUpperCase(),
              onPressed: () {
                if (state is Verified) {
                  context.read<VerificationCubit>().createVerifiedUser(
                    name: name,
                    email: email,
                    uId: userId,
                  );
                } else {
                  context.read<VerificationCubit>().checkEmailVerification();
                }
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
            // SizedBox(height: 20.h),
            // if (state is Verified)
            //   CustomButton(
            //     text: S.of(context).completeRegistration,
            //     onPressed: () {
            //       context.read<VerificationCubit>().createVerifiedUser(
            //         name: name,
            //         email: email,
            //         uId: userId,
            //       );
            //     },
            //   ),
            SizedBox(height: 40.h),
            ThreeOverlappingSquares(),
          ],
        );
      },
    );
  }
}
