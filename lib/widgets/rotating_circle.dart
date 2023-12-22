// lib/widgets/rotating_circle.dart
import 'package:flutter/material.dart';

class RotatingCircle extends StatelessWidget {
  final Animation<double> animation;
  final bool reverse;

  RotatingCircle({required this.animation, this.reverse = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50 * animation.value,
      height: 50 * animation.value,
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: reverse ? Colors.red : Colors.blue,
      ),
    );
  }
}
