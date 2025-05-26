import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vibe_link/core/utils/app_assets.dart';
import 'package:vibe_link/core/utils/validators.dart';
import 'package:vibe_link/features/auth/presentation/controllers/login/login_cubit.dart';
import 'package:vibe_link/features/auth/presentation/widgets/custom_text_form_field.dart';
import 'package:vibe_link/generated/l10n.dart';

class LoginEmailAndPassword extends StatefulWidget {
  const LoginEmailAndPassword({super.key});

  @override
  State<LoginEmailAndPassword> createState() => _LoginEmailAndPasswordState();
}

class _LoginEmailAndPasswordState extends State<LoginEmailAndPassword> {
  bool isObscured = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<LoginCubit>().formKey,
      child: Column(
        children: [
          CustomTextFormField(
            controller: context.read<LoginCubit>().emailController,
            hintText: S.of(context).email,
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              return Validators.validateEmail(value, context);
            },
          ),
          const SizedBox(height: 20),
          CustomTextFormField(
            validator: (value) {
              return Validators.validatePassword(value, context);
            },
            controller: context.read<LoginCubit>().passwordController,
            isPassword: true,
            hintText: S.of(context).password,
            isObscured: isObscured,
            keyboardType: TextInputType.visiblePassword,
            suffixIcon: IconButton(
              icon: SvgPicture.asset(
                isObscured ? AppAssets.hide : AppAssets.show,
                height: 20,
                width: 20,
              ),
              onPressed: () {
                setState(() {
                  isObscured = !isObscured;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
