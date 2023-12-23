import 'package:flutter/material.dart';
import 'dart:math';

class RandomElementsScreen extends StatefulWidget {
  const RandomElementsScreen({super.key});

  @override
  _RandomElementsScreenState createState() => _RandomElementsScreenState();
}

class _RandomElementsScreenState extends State<RandomElementsScreen> {
  List<Widget> elements = [];

  @override
  void initState() {
    super.initState();
    // Создаем 50 элементов при инициализации
    for (int i = 0; i < 50; i++) {
      _addRandomElement();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Random Elements Screen'),
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // По два элемента в строке
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
        ),
        itemCount: elements.length,
        itemBuilder: (context, index) {
          return elements[index];
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addRandomElement,
        child: const Icon(Icons.add),
      ),
    );
  }

  void _addRandomElement() {
    final random = Random();
    final randomNumber =
        random.nextInt(3); // Генерация случайного числа (0, 1 или 2)

    setState(() {
      if (randomNumber == 0) {
        // Добавление случайного текстового блока
        elements.add(_buildRandomTextBlock());
      } else if (randomNumber == 1) {
        // Добавление случайной иконки
        elements.add(_buildRandomIcon());
      } else {
        // Добавление случайного контейнера с цветом
        elements.add(_buildRandomColorContainer());
      }
    });
  }

  Widget _buildRandomTextBlock() {
    return Container(
      margin: const EdgeInsets.all(8.0),
      padding: const EdgeInsets.all(16.0),
      color: Colors.lightBlue,
      child: Text(
        'Random Text ${elements.length + 1}',
        style: const TextStyle(fontSize: 18.0),
      ),
    );
  }

  Widget _buildRandomIcon() {
    final randomIcon =
        Icons.flutter_dash; // Замените на любой другой иконки по вашему выбору

    return Container(
      margin: const EdgeInsets.all(8.0),
      padding: const EdgeInsets.all(16.0),
      color: Colors.lightGreen,
      child: Icon(randomIcon, size: 36.0, color: Colors.white),
    );
  }

  Widget _buildRandomColorContainer() {
    final randomColor = _generateRandomColor();

    return Container(
      margin: const EdgeInsets.all(8.0),
      padding: const EdgeInsets.all(16.0),
      color: randomColor,
      child: Center(
        child: Text(
          'Container ${elements.length + 1}',
          style: const TextStyle(fontSize: 18.0, color: Colors.white),
        ),
      ),
    );
  }

  Color _generateRandomColor() {
    return Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);
  }
}
