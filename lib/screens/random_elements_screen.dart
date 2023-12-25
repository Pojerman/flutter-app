import 'package:flutter/material.dart';
import 'dart:math';

class RandomElementsScreen extends StatefulWidget {
  const RandomElementsScreen({Key? key}) : super(key: key);

  @override
  _RandomElementsScreenState createState() => _RandomElementsScreenState();
}

class _RandomElementsScreenState extends State<RandomElementsScreen>
    with TickerProviderStateMixin {
  List<Widget> elements = [];

  @override
  void initState() {
    super.initState();
    _addRandomElements();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Много элементов'),
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
        onPressed: _addRandomElements,
        child: const Icon(Icons.add),
      ),
    );
  }

  void _addRandomElements() {
    final random = Random();
    final numberOfElementsToAdd = random.nextInt(15) + 1;

    setState(() {
      for (int i = 0; i < numberOfElementsToAdd; i++) {
        final randomNumber = random.nextInt(3);

        if (randomNumber == 0) {
          elements.insert(0, _buildRandomTextBlock());
        } else if (randomNumber == 1) {
          elements.insert(0, _buildRandomIcon());
        } else {
          elements.insert(0, _buildRandomColorContainer());
        }
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
      child: _RotatingIcon(icon: randomIcon, size: 36.0),
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

class _RotatingIcon extends StatefulWidget {
  final IconData icon;
  final double size;

  const _RotatingIcon({Key? key, required this.icon, required this.size})
      : super(key: key);

  @override
  _RotatingIconState createState() => _RotatingIconState();
}

class _RotatingIconState extends State<_RotatingIcon>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(); // Делаем анимацию бесконечной
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Transform.rotate(
          angle: _controller.value * 2 * pi,
          child: Icon(widget.icon, size: widget.size, color: Colors.white),
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
