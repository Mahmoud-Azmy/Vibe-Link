import 'package:flutter/material.dart';
import 'package:vibe_link/core/features/onBoarding/on_boardign.dart';

class VibeLink extends StatelessWidget {
  const VibeLink({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'VibeLink',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const OnBoardign(),
    );
  }
}
