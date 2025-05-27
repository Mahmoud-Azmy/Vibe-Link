import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:vibe_link/core/helper/locale_provider.dart';
import 'package:vibe_link/core/theme/app_theme.dart';
import 'package:vibe_link/core/utils/app_router.dart';
import 'package:vibe_link/generated/l10n.dart';
import 'package:vibe_link/main.dart';

class VibeLink extends StatelessWidget {
  const VibeLink({super.key});

  @override
  Widget build(BuildContext context) {
    final localeProvider = context.watch<LocaleProvider>();
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp.router(
        locale: localeProvider.locale,
        localizationsDelegates: [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        title: 'VibeLink',
        debugShowCheckedModeBanner: false,
        theme: appTheme(),
        routerConfig: AppRouter.router(
          isUserLoggedIn ? AppRouter.homeView : AppRouter.onBoarding,
        ),
      ),
    );
  }
}
