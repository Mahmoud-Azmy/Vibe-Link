import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:vibe_link/core/functions/error_dialog.dart';
import 'package:vibe_link/core/utils/app_router.dart';
import 'package:vibe_link/features/auth/presentation/controllers/login/login_cubit.dart';
import 'package:vibe_link/features/auth/presentation/controllers/login/login_state.dart';

class LoginBlocListener extends StatelessWidget {
  const LoginBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
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
            GoRouter.of(context).push(AppRouter.homeView);
            break;
          case Error:
            Navigator.pop(context);
            errorDialog(context, (state as Error).message);
            break;
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}
