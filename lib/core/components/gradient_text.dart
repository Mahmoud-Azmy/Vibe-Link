import 'package:flutter/material.dart';

class GradientText extends StatelessWidget {
  final String text;
  final List<Color> colors;
  final TextStyle? textStyle;

  const GradientText({
    super.key,
    required this.text,
    required this.colors,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) {
        return LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: colors,
        ).createShader(bounds);
      },
      child: Text(
        text,
        style:
            textStyle ??
            const TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color:
                  Colors
                      .white, // This color doesn't matter; the shader overrides it
            ),
      ),
    );
  }
}
