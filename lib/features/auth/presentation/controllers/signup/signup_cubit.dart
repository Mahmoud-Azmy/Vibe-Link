import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vibe_link/core/utils/app_strings.dart';
import 'package:vibe_link/features/auth/data/repos/auth_repo.dart';
import 'package:vibe_link/features/auth/presentation/controllers/signup/signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit(this._authRepo) : super(SignupState.initial());
  final AuthRepo _authRepo;
  final formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  void signUp() async {
    emit(SignupState.loading());
    final result = await _authRepo.signUpUseUser(
      email: emailController.text,
      password: passwordController.text,
      name: nameController.text,
    );
    result.fold(
      (failure) {
        emit(SignupState.error(failure.errorMessage));
      },
      (userId) {
        emit(SignupState.success(AppStrings.signupSuccessful));
      },
    );
  }
}
