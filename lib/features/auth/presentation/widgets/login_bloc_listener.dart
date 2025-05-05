import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:vibe_link/core/functions/error_dialog.dart';
import 'package:vibe_link/core/functions/success_dialog.dart';
import 'package:vibe_link/core/utils/app_router.dart';
import 'package:vibe_link/core/utils/app_strings.dart';
import 'package:vibe_link/features/auth/presentation/controllers/login/login_cubit.dart';
import 'package:vibe_link/features/auth/presentation/controllers/login/login_state.dart';

class LoginBlocListener extends StatelessWidget {
  const LoginBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is Loading) {
          // Show loading indicator
          showDialog(
            context: context,
            barrierDismissible: false,
            builder:
                (context) => const Center(child: CircularProgressIndicator()),
          );
        }
        if (state is Success) {
          Navigator.pop(context);
          GoRouter.of(context).push(AppRouter.homeView);
          //and go to the Verification screen
        }
        if (state is EmailNotVerified) {
          Navigator.pop(context);
          showSuccessDialog(
            title: AppStrings.notVerified,
            message: AppStrings.notVerifiedMessage,
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
      child: const SizedBox.shrink(),
    );
  }
}
