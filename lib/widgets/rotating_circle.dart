// lib/widgets/rotating_circle.dart
import 'dart:math';

import 'package:flutter/material.dart';

class RotatingCircle extends StatefulWidget {
  final Animation<double> animation;

  RotatingCircle({required this.animation});

  @override
  _RotatingCircleState createState() => _RotatingCircleState();
}

class _RotatingCircleState extends State<RotatingCircle> {
  late Color _circleColor;

  @override
  void initState() {
    super.initState();
    // Генерируем случайный цвет при создании виджета
    _circleColor = generateRandomColor();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50 * widget.animation.value,
      height: 50 * widget.animation.value,
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: _circleColor,
      ),
    );
  }

  Color generateRandomColor() {
    // Генерация случайных значений для каждого канала цвета (RGB)
    final random = Random();
    return Color.fromARGB(
      255,
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
    );
  }
}
