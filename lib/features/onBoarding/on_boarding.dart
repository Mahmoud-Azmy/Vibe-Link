import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:vibe_link/core/theme/app_text_style.dart';
import 'package:vibe_link/core/utils/app_assets.dart';
import 'package:vibe_link/core/utils/app_router.dart';
import 'package:vibe_link/features/onBoarding/widgets/diamond_image_layout.dart';
import 'package:vibe_link/generated/l10n.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Expanded(
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(AppAssets.onBoarding),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(S.of(context).appName, style: AppTextStyles.font40Bold),
              SizedBox(height: 40),
              DiamondImageLayout(),
              SizedBox(height: 40),
              Text(
                S.of(context).appTagline,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  letterSpacing: 2,
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  GoRouter.of(context).go(AppRouter.loginView);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white.withAlpha(50),
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text(S.of(context).getStarted, style: TextStyle(fontSize: 16)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
