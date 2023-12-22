// lib/screens/home_screen.dart
import 'package:flutter/material.dart';
import 'rotating_circles_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter App'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => RotatingCirclesScreen()),
            );
          },
          child: Text('Вращающиеся круги'),
        ),
      ),
    );
  }
}
