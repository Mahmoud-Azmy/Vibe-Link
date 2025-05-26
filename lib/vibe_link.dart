import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vibe_link/core/theme/app_theme.dart';
import 'package:vibe_link/core/utils/app_router.dart';
import 'package:vibe_link/generated/l10n.dart';
import 'package:vibe_link/main.dart';

class VibeLink extends StatelessWidget {
  const VibeLink({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp.router(
        locale: Locale('ar'),
        localizationsDelegates: [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        title: 'VibeLink', // Use static title or move to where context is available
        debugShowCheckedModeBanner: false,
        theme: appTheme(),
        routerConfig: AppRouter.router(
          isUserLoggedIn ? AppRouter.homeView : AppRouter.onBoarding,
        ),
      ),
    );
  }
}
