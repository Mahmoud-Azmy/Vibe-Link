import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vibe_link/core/functions/error_dialog.dart';
import 'package:vibe_link/core/functions/success_dialog.dart';
import 'package:vibe_link/features/auth/presentation/controllers/signup/signup_cubit.dart';
import 'package:vibe_link/features/auth/presentation/controllers/signup/signup_state.dart';

class SignUpBlocListener extends StatelessWidget {
  const SignUpBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignupCubit, SignupState>(
      listener: (context, state) {
        switch (state.runtimeType) {
          case Loading:
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) {
                return const Center(child: CircularProgressIndicator());
              },
            );
            break;
          case Success:
            Navigator.pop(context);
            //and go to the Verification screen
            showSuccessDialog(context);
            break;
          case Error:
            Navigator.pop(context);
            errorDialog(context, (state as Error).message);
            break;
        }
      },
      child: SizedBox.shrink(),
    );
  }
}
