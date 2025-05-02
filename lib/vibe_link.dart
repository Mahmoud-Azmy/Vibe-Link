import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vibe_link/core/theme/app_theme.dart';
import 'package:vibe_link/core/utils/app_router.dart';

class VibeLink extends StatelessWidget {
  const VibeLink({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp.router(
        title: 'VibeLink',
        debugShowCheckedModeBanner: false,
        theme: appTheme(),
        routerConfig: AppRouter.router(AppRouter.loginView),
      ),
    );
  }
}
