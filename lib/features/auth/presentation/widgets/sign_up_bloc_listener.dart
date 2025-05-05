import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vibe_link/core/functions/error_dialog.dart';
import 'package:vibe_link/core/functions/success_dialog.dart';
import 'package:vibe_link/core/utils/app_router.dart';
import 'package:vibe_link/core/utils/app_strings.dart';
import 'package:vibe_link/features/auth/presentation/controllers/signup/signup_cubit.dart';
import 'package:vibe_link/features/auth/presentation/controllers/signup/signup_state.dart';

class SignUpBlocListener extends StatelessWidget {
  const SignUpBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignupCubit, SignupState>(
      listener: (context, state) {
        if (state is Loading) {
          // Show loading indicator
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) => Center(child: CircularProgressIndicator()),
          );
        }
        if (state is Success) {
          Navigator.pop(context);
          //and go to the Verification screen
          showSuccessDialog(
            title: AppStrings.signupSuccessful,
            message: AppStrings.signupSuccessMessage,
            route: AppRouter.verification,
            buttonTitle: AppStrings.goToVerification,
            context: context,
            userId: state.userId,
            email: state.email,
            name: state.name,
          );
        }
        if (state is Error) {
          Navigator.pop(context);
          // Show error message
          errorDialog(context, state.message);
        }
      },
      child: SizedBox.shrink(),
    );
  }
}
