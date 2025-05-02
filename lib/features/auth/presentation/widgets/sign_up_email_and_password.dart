import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vibe_link/core/utils/app_assets.dart';
import 'package:vibe_link/features/auth/presentation/widgets/custom_text_form_field.dart';

class SignUpEmailAndPassword extends StatefulWidget {
  const SignUpEmailAndPassword({super.key});

  @override
  State<SignUpEmailAndPassword> createState() => _SignUpEmailAndPasswordState();
}

class _SignUpEmailAndPasswordState extends State<SignUpEmailAndPassword> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  bool isObscured = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextFormField(
          controller: nameController,
          hintText: 'Name',
          keyboardType: TextInputType.name,
        ),
        const SizedBox(height: 20),
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
