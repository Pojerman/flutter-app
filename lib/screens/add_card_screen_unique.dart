import 'dart:math';
import 'package:flutter/material.dart';

class AddCardScreenUnique extends StatefulWidget {
  @override
  _AddCardScreenState createState() => _AddCardScreenState();
}

class _AddCardScreenState extends State<AddCardScreenUnique> {
  List<CardItem> cardItems = [];
  Key _lastKey = UniqueKey(); // Используем ключ для уникальности

  String getRandomImagePath() {
    final List<String> imagePaths = [
      'lib/assets/images/screen1.jpg',
      'lib/assets/images/screen2.jpg',
      'lib/assets/images/screen3.jpg',
      'lib/assets/images/screen4.jpg',
      'lib/assets/images/screen5.jpg',
    ];

    final random = Random(DateTime.now().millisecondsSinceEpoch);
    final index = random.nextInt(imagePaths.length);
    return imagePaths[index];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Card Screen'),
      ),
      body: ListView.builder(
        itemCount: cardItems.length,
        itemBuilder: (context, index) {
          return cardItems[index];
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            cardItems.insert(
              0,
              CardItem(
                key: _lastKey, // Используем текущий ключ
                image: AssetImage(getRandomImagePath()),
                text: 'Новая карточка ${cardItems.length + 1}',
              ),
            );
            _lastKey = UniqueKey(); // Создаем новый уникальный ключ
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class CardItem extends StatelessWidget {
  final Key key;
  final ImageProvider image;
  final String text;

  CardItem({required this.key, required this.image, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image(image: image, height: 150, fit: BoxFit.cover),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(text, style: TextStyle(fontSize: 16)),
          ),
        ],
      ),
    );
  }
}
