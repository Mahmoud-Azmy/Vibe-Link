import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vibe_link/core/functions/error_dialog.dart';
import 'package:vibe_link/core/functions/success_dialog.dart';
import 'package:vibe_link/core/theme/app_colors.dart';
import 'package:vibe_link/features/auth/presentation/controllers/signup/signup_cubit.dart';
import 'package:vibe_link/features/auth/presentation/controllers/signup/signup_state.dart';

class SignUpBlocListener extends StatelessWidget {
  const SignUpBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignupCubit, SignupState>(
      listener: (context, state) {
        if (state is Loading) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder:
                (context) => const Center(
                  child: CircularProgressIndicator(color: AppColors.primary),
                ),
          );
        } else if (state is Error) {
          Navigator.pop(context);
          errorDialog(context, state.message);
        } else if (state is Success) {
          Navigator.pop(context);
          showSuccessDialog(context);
        }
      },
      child: SizedBox.shrink(),
    );
  }
}
