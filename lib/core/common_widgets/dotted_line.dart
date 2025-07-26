import 'dart:ui';

import 'package:flutter/material.dart';

class DottedLine extends StatelessWidget {
  final double height;
  final Color color;
  final double? width;
  final double? space;

  DottedLine({
    this.height = 1,
    this.color = Colors.black,
    this.width,
    this.space,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(double.infinity, height),
      painter: DottedLinePainter(color: color, space: space, width: width),
    );
  }
}
class DottedLinePainter extends CustomPainter {
  final Color color;
  final double? width;
  final double? space;

  DottedLinePainter({
    required this.color,
    this.width,
    this.space,
  });

  @override
  void paint(Canvas canvas, Size size) {
    double dashWidth = width ?? 5.0, dashSpace = space ?? 3.0;
    final paint = Paint()
      ..color = color
      ..strokeWidth = 1;

    double startX = 0;
    while (startX < size.width) {
      canvas.drawLine(Offset(startX, 0), Offset(startX + dashWidth, 0), paint);
      startX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}