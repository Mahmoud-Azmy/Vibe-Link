import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vibe_link/core/helper/shared_pref_helper.dart';
import 'package:vibe_link/core/utils/app_strings.dart';
import 'package:vibe_link/features/auth/data/repos/auth_repo.dart';
import 'package:vibe_link/features/auth/presentation/controllers/login/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._authRepo) : super(LoginState.initial());
  final AuthRepo _authRepo;
  final formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  void login() async {
    emit(LoginState.loading());
    final result = await _authRepo.loginUseUser(
      email: emailController.text,
      password: passwordController.text,
    );
    result.fold(
      (failure) {
        emit(LoginState.error(failure.errorMessage));
      },
      (tuple) {
        final (userId, isVerified) = tuple;
        if (!isVerified) {
          emit(
            LoginState.emailNotVerified(
              email: emailController.text,
              userId: userId,
              name: 'Unknown',
            ),
          );
          return;
        }
        SharedPrefHelper.setSecuredString(AppStrings.userId, userId);
        emit(LoginState.success(AppStrings.loginSuccessful));
      },
    );
  }
}
