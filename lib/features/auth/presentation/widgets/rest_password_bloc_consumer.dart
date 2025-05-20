import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:vibe_link/core/components/gradient_text.dart';
import 'package:vibe_link/core/functions/error_dialog.dart';
import 'package:vibe_link/core/functions/success_dialog.dart';
import 'package:vibe_link/core/theme/app_colors.dart';
import 'package:vibe_link/core/theme/app_text_style.dart';
import 'package:vibe_link/core/utils/app_strings.dart';
import 'package:vibe_link/core/utils/validators.dart';
import 'package:vibe_link/features/auth/presentation/controllers/resetPassword/rest_password_cubit.dart';
import 'package:vibe_link/features/auth/presentation/controllers/resetPassword/rest_password_state.dart';
import 'package:vibe_link/core/components/custom_button.dart';
import 'package:vibe_link/features/auth/presentation/widgets/custom_container_message.dart';
import 'package:vibe_link/features/auth/presentation/widgets/custom_text_form_field.dart';
import 'package:vibe_link/features/auth/presentation/widgets/three_overlapping_squares.dart';

class RestPasswordBlocConsumer extends StatefulWidget {
  const RestPasswordBlocConsumer({super.key});

  @override
  State<RestPasswordBlocConsumer> createState() =>
      _RestPasswordBlocConsumerState();
}

class _RestPasswordBlocConsumerState extends State<RestPasswordBlocConsumer> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RestPasswordCubit, RestPasswordState>(
      listener: (context, state) {
        if (state is Error) {
          errorDialog(context, state.message);
        }
        if (state is Success) {
          GoRouter.of(context).pop();
          showSuccessDialog(
            context: context,
            message: AppStrings.emailResetSentMessage,
            title: AppStrings.emailResetSent,
            buttonTitle: AppStrings.gotIt,
          );
        }
      },
      builder: (context, state) {
        return Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GradientText(
                colors: AppColors.buttonsColor,
                text: AppStrings.typeYourEmail.toUpperCase(),
                textStyle: AppTextStyles.font18Bold,
              ),
              SizedBox(height: 16.h),
              CustomContainerMessage(message: AppStrings.typeYourEmail),
              SizedBox(height: 40.h),
              CustomTextFormField(
                hintText: AppStrings.email,
                controller: _controller,
                validator: (value) {
                  return Validators.validateEmail(value);
                },
              ),
              SizedBox(height: 20.h),
              CustomButton(
                text: AppStrings.send.toUpperCase(),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    context.read<RestPasswordCubit>().resetPassword(
                      _controller.text,
                    );
                  }
                },
                child:
                    state is Loading
                        ? Center(
                          child: const CircularProgressIndicator(
                            color: Colors.white,
                          ),
                        )
                        : null,
              ),
              SizedBox(height: 40.h),
              ThreeOverlappingSquares(),
            ],
          ),
        );
      },
    );
  }
}
