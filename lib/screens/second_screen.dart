import 'dart:math';
import 'package:flutter/material.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  List<Widget> contentList = [];

  @override
  void initState() {
    super.initState();
    _addRandomContent();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Карточки с текстом'),
      ),
      body: ListView.builder(
        itemCount: contentList.length,
        itemBuilder: (context, index) {
          return contentList[index];
        },
      ),
      floatingActionButton: FloatingActionButton(
        key: const Key('addPost'),
        onPressed: () {
          _addRandomContent();
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  void _addRandomContent() {
    int randomImageNumber = Random().nextInt(5) + 1;
    setState(() {
      contentList.add(
        Column(
          children: [
            Image.asset(
              'lib/assets/images/screen$randomImageNumber.jpg', // Поменяйте на путь к вашему изображению
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
              'Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
              style: TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      );
    });
  }
}
