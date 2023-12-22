// widgets/custom_shader_painter.dart
import 'dart:math' as math;
import 'dart:ui' as ui;
import 'package:flutter/material.dart';

class CustomShaderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint();
    final double radius = size.width / 2;

    final Gradient gradient = RadialGradient(
      colors: [Colors.red, Colors.blue],
      stops: [0.2, 0.8],
    );

    final Rect rect =
        Rect.fromCircle(center: Offset(radius, radius), radius: radius);

    paint.shader = gradient.createShader(rect);

    canvas.drawCircle(Offset(radius, radius), radius, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
