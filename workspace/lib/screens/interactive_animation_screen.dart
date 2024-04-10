import 'dart:math';

import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class ShapesScreen extends StatefulWidget {
  const ShapesScreen({super.key});

  @override
  _ShapesScreenState createState() => _ShapesScreenState();
}

class _ShapesScreenState extends State<ShapesScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  bool _reverseRotation = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )..repeat(reverse: _reverseRotation);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  Future<void> _startStopAnimation() async {
    if (_animationController.isAnimating) {
      _animationController.stop();
    } else {
      _animationController.repeat(reverse: _reverseRotation);
    }
    setState(() {});
  }

  Widget _buildRotatingGlassEffect(Icon icon) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return Transform.rotate(
          angle: _animationController.value * 2 * pi,
          child: _buildGlassEffect(icon),
        );
      },
    );
  }

  Widget _buildGlassEffect(Icon icon) {
    return ShaderMask(
      shaderCallback: (Rect bounds) {
        return ui.Gradient.linear(
          const Offset(0, 0),
          Offset(bounds.width, bounds.height),
          [
            Colors.transparent,
            Colors.transparent,
            const Color.fromARGB(64, 225, 133, 243),
            const Color.fromARGB(255, 247, 164, 236),
            const Color.fromARGB(255, 255, 115, 157),
            Colors.transparent,
            Colors.transparent,
          ],
          [0.0, 0.1, 0.3, 0.5, 0.7, 0.9, 1.0],
        );
      },
      blendMode: BlendMode.srcATop,
      child: icon,
    );
  }

  List<Widget> _buildRotatingGlassEffects(List<Icon> icons) {
    return icons.map((icon) => _buildRotatingGlassEffect(icon)).toList();
  }

  @override
  Widget build(BuildContext context) {
    List<Icon> icons = [
      const Icon(Icons.category_outlined, size: 100, color: Colors.blue),
      const Icon(Icons.square, size: 100, color: Colors.blue),
      const Icon(Icons.flutter_dash, size: 100, color: Colors.blue),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Анимация с иконками и шейдером'),
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 247, 255, 199),
                  Color.fromARGB(255, 87, 207, 255),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: _buildRotatingGlassEffects(icons),
            ),
          ),
        ],
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: _startStopAnimation,
            child: Icon(_animationController.isAnimating
                ? Icons.stop
                : Icons.play_arrow),
            heroTag: null,
          ),
        ],
      ),
    );
  }
}
