import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:vibe_link/core/utils/app_assets.dart';

class DiamondImageLayout extends StatelessWidget {
  const DiamondImageLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).width * 0.64,
      width: MediaQuery.sizeOf(context).width * 0.64,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Top Image
          Positioned(
            top: 0,
            child: Transform.rotate(
              angle: math.pi / 4,
              child: SizedBox(
                width: 100,
                height: 100,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(AppAssets.onB2),
                ),
              ),
            ),
          ),
          // Left Image
          Positioned(
            left: 0,
            child: Transform.rotate(
              angle: math.pi / 4,
              child: SizedBox(
                width: 100,
                height: 100,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(AppAssets.onB1),
                ),
              ),
            ),
          ),
          // Right Image
          Positioned(
            right: 0,
            child: Transform.rotate(
              angle: math.pi / 4,
              child: SizedBox(
                width: 100,
                height: 100,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(AppAssets.onB3),
                ),
              ),
            ),
          ),
          // Bottom Image
          Positioned(
            bottom: 0,
            child: Transform.rotate(
              angle: math.pi / 4,
              child: SizedBox(
                width: 100,
                height: 100,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(AppAssets.onB4),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
