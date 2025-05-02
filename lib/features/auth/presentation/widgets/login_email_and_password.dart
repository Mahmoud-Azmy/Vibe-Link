import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vibe_link/core/utils/app_assets.dart';
import 'package:vibe_link/features/auth/presentation/widgets/custom_text_form_field.dart';

class LoginEmailAndPassword extends StatefulWidget {
  const LoginEmailAndPassword({super.key});

  @override
  State<LoginEmailAndPassword> createState() => _LoginEmailAndPasswordState();
}

class _LoginEmailAndPasswordState extends State<LoginEmailAndPassword> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isObscured = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextFormField(
          controller: emailController,
          hintText: 'Email',
          keyboardType: TextInputType.emailAddress,
        ),
        const SizedBox(height: 20),
        CustomTextFormField(
          controller: passwordController,
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
    );
  }
}
