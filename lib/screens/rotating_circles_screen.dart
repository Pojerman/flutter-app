// lib/screens/rotating_circles_screen.dart
import 'package:flutter/material.dart';
import '../widgets/rotating_circle.dart';

class RotatingCirclesScreen extends StatefulWidget {
  @override
  _RotatingCirclesScreenState createState() => _RotatingCirclesScreenState();
}

class _RotatingCirclesScreenState extends State<RotatingCirclesScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    _animation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(_controller)
      ..addListener(() {
        setState(() {});
      });

    _controller.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Вращающиеся круги'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RotatingCircle(animation: _animation),
            SizedBox(height: 20),
            RotatingCircle(animation: _animation, reverse: true),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
