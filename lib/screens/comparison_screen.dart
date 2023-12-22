// screens/comparison_screen.dart
import 'dart:math' as math;
import 'package:flutter/material.dart';
import '../widgets/custom_shader_painter.dart';

class ComparisonScreen extends StatefulWidget {
  @override
  _ComparisonScreenState createState() => _ComparisonScreenState();
}

class _ComparisonScreenState extends State<ComparisonScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 5),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Comparison Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Анимированный круг
            AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return Transform.rotate(
                  angle: _controller.value * 2 * math.pi,
                  child: Container(
                    width: 100,
                    height: 100,
                    color: Colors.blue,
                  ),
                );
              },
            ),
            SizedBox(height: 20),

            // Графика с использованием пользовательских шейдеров
            SizedBox(
              width: 200,
              height: 200,
              child: CustomPaint(
                painter: CustomShaderPainter(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
