import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:vibe_link/core/theme/app_text_style.dart';
import 'package:vibe_link/core/utils/app_assets.dart';
import 'package:vibe_link/core/utils/app_router.dart';
import 'package:vibe_link/core/utils/app_strings.dart';
import 'package:vibe_link/features/auth/presentation/controllers/login/login_cubit.dart';
import 'package:vibe_link/features/auth/presentation/widgets/custom_button.dart';
import 'package:vibe_link/features/auth/presentation/widgets/login_bloc_listener.dart';
import 'package:vibe_link/features/auth/presentation/widgets/login_by.dart';
import 'package:vibe_link/features/auth/presentation/widgets/login_email_and_password.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.4,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(AppAssets.welcome),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.4,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.blue.withAlpha(77),
                    Colors.purple.withAlpha(77),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 100.h,
              left: 0,
              right: 0,
              child: Center(
                child: Text(
                  AppStrings.appName,
                  style: AppTextStyles.font24Bold,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.65,
                padding: EdgeInsets.only(left: 30.w, right: 30.w, top: 40.h),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      LoginEmailAndPassword(),
                      // Forgot Password Link
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {},
                          child: Text(
                            AppStrings.forgotPassword,
                            style: AppTextStyles.font14Grey,
                          ),
                        ),
                      ),
                      SizedBox(height: 20.h),
                      // Log In Button
                      CustomButton(
                        text: AppStrings.loginButton,
                        onPressed: () {
                          onPressedLogin(context);
                        },
                      ),
                      SizedBox(height: 20.h),
                      // Or Log In By Text
                      Text(
                        AppStrings.orLoginBy,
                        style: AppTextStyles.font14Grey,
                      ),
                      SizedBox(height: 20.h),
                      // Social Login Buttons
                      LoginBy(),
                      SizedBox(height: 20.h),
                      // Sign Up Link
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            AppStrings.noAccount,
                            style: AppTextStyles.font14Grey,
                          ),
                          TextButton(
                            onPressed: () {
                              GoRouter.of(context).push(AppRouter.registerView);
                            },
                            child: Text(
                              AppStrings.signupButton,
                              style: AppTextStyles.font14Bold,
                            ),
                          ),
                        ],
                      ),
                      LoginBlocListener(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onPressedLogin(BuildContext context) {
    if (context.read<LoginCubit>().formKey.currentState!.validate()) {
      context.read<LoginCubit>().login();
    }
  }
}
