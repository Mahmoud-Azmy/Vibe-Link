import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vibe_link/core/di/dependency_injection.dart';
import 'package:vibe_link/core/theme/app_text_style.dart';
import 'package:vibe_link/core/utils/app_assets.dart';
import 'package:vibe_link/features/auth/data/repos/auth_repo.dart';
import 'package:vibe_link/features/auth/presentation/controllers/verification/verification_cubit.dart';
import 'package:vibe_link/features/auth/presentation/widgets/verifiction_bloc_consumer.dart';
import 'package:vibe_link/generated/l10n.dart';

class VerificationScreen extends StatelessWidget {
  final String userId;
  final String email;
  final String name;

  const VerificationScreen({
    super.key,
    required this.userId,
    required this.email,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
        create: (context) => VerificationCubit(sl<AuthRepo>()),
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
                    S.of(context).appName,
                    style: AppTextStyles.font24Bold,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.7,
                  padding: EdgeInsets.only(left: 30.w, right: 30.w, top: 30.h),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: VerifictionBlocConsumer(
                      name: name,
                      email: email,
                      userId: userId,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
