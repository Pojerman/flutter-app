// lib/screens/home_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_app/screens/add_card_screen_unique.dart';
import 'package:flutter_app/screens/tic_tac_toe_screen.dart';
import 'comparison_screen.dart';
import 'rotating_circles_screen.dart';
import 'add_card_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => RotatingCirclesScreen()),
                );
              },
              child: Text('Вращающиеся круги'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddCardScreen()),
                );
              },
              child: Text('Карточки без ключа'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => AddCardScreenUnique()),
                );
              },
              child: Text('Карточки с ключом'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TicTacToeScreen()),
                );
              },
              child: Text('Крести нолики'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ComparisonScreen()),
                );
              },
              child: Text('Сравнительный экран'),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
