import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:vibe_link/core/functions/error_dialog.dart';
import 'package:vibe_link/core/functions/success_dialog.dart';
import 'package:vibe_link/core/utils/app_router.dart';
import 'package:vibe_link/features/auth/presentation/controllers/signup/signup_cubit.dart';
import 'package:vibe_link/features/auth/presentation/controllers/signup/signup_state.dart';
import 'package:vibe_link/generated/l10n.dart';

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
            title: S.of(context).signupSuccessful,
            message: S.of(context).signupSuccessMessage,
            route: AppRouter.verification,
            buttonTitle: S.of(context).goToVerification,
            context: context,
            userId: state.userId,
            email: state.email,
            name: state.name,
          );
        }
        if (state is Error) {
          GoRouter.of(context).pop(context);
          // Show error message
          errorDialog(context, state.message);
        }
      },
      child: SizedBox.shrink(),
    );
  }
}
