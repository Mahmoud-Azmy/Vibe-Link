import 'package:flutter/material.dart';
import 'package:vibe_link/core/utils/app_assets.dart';

class OnBoardign extends StatelessWidget {
  const OnBoardign({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppAssets.onBoarding),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Text(
            'OnBoarding',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
