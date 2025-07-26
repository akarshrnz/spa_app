

import 'package:flutter/material.dart';

class GradientCircle extends StatelessWidget {
  final double size;
  final double radius;
  final List<Color> colors;
  final List<double>? stops;

  const GradientCircle({
    super.key,
    required this.size,
    required this.radius,
    required this.colors,
    this.stops,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: RadialGradient(
          radius: radius,
          colors: colors,
          stops: stops,
        ),
      ),
    );
  }
}