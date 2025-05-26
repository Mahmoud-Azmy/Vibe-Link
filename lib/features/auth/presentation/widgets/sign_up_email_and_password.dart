import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vibe_link/core/utils/app_assets.dart';
import 'package:vibe_link/core/utils/validators.dart';
import 'package:vibe_link/features/auth/presentation/controllers/signup/signup_cubit.dart';
import 'package:vibe_link/features/auth/presentation/widgets/custom_text_form_field.dart';
import 'package:vibe_link/generated/l10n.dart';

class SignUpEmailAndPassword extends StatefulWidget {
  const SignUpEmailAndPassword({super.key});

  @override
  State<SignUpEmailAndPassword> createState() => _SignUpEmailAndPasswordState();
}

class _SignUpEmailAndPasswordState extends State<SignUpEmailAndPassword> {
  bool isObscured = false;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<SignupCubit>().formKey,
      child: Column(
        children: [
          CustomTextFormField(
            controller: context.read<SignupCubit>().nameController,
            hintText: S.of(context).name,
            keyboardType: TextInputType.name,
            validator: (vakue) {
              return Validators.validateUsername(vakue, context);
            },
          ),
          const SizedBox(height: 20),
          CustomTextFormField(
            controller: context.read<SignupCubit>().emailController,
            hintText: S.of(context).email,
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              return Validators.validateEmail(value, context);
            },
          ),
          const SizedBox(height: 20),
          CustomTextFormField(
            controller: context.read<SignupCubit>().passwordController,
            validator: (value) {
              return Validators.validatePassword(value, context);
            },
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
