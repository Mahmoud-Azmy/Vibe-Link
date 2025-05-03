import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ThreeOverlappingSquares extends StatelessWidget {
  const ThreeOverlappingSquares({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80.h,
      width: 220.w,
      child: Stack(
        children: [
          Positioned(
            left: 0,
            top: 0,
            child: Transform.rotate(
              angle: math.pi / 4,
              child: CustomSquareShape(),
            ),
          ),
          Positioned(
            left: 70.w,
            top: 0,
            child: Transform.rotate(
              angle: math.pi / 4,
              child: CustomSquareShape(),
            ),
          ),
          Positioned(
            left: 140.w,
            top: 0,
            child: Transform.rotate(
              angle: math.pi / 4,
              child: CustomSquareShape(),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomSquareShape extends StatelessWidget {
  const CustomSquareShape({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: LinearGradient(
          colors: [
            Color(0xFF5151C6).withAlpha(20),
            Color(0xFF5151C6).withAlpha(102),
          ],
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
        ),
      ),
    );
  }
}
