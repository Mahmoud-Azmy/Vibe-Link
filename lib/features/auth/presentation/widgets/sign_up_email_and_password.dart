import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vibe_link/core/utils/app_assets.dart';
import 'package:vibe_link/core/utils/validators.dart';
import 'package:vibe_link/features/auth/presentation/controllers/signup/signup_cubit.dart';
import 'package:vibe_link/features/auth/presentation/widgets/custom_text_form_field.dart';

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
            hintText: 'Name',
            keyboardType: TextInputType.name,
            validator: (vakue) {
              Validators.validateUsername(vakue);
              return null;
            },
          ),
          const SizedBox(height: 20),
          CustomTextFormField(
            controller: context.read<SignupCubit>().emailController,
            hintText: 'Email',
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              Validators.validateEmail(value);
              return null;
            },
          ),
          const SizedBox(height: 20),
          CustomTextFormField(
            controller: context.read<SignupCubit>().passwordController,
            validator: (value) {
              Validators.validatePassword(value);
              return null;
            },
            isPassword: true,
            hintText: 'Password',
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
