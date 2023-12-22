import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Крестики-Нолики'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => TicTacToeScreen()),
            );
          },
          child: Text('Играть в Крестики-Нолики'),
        ),
      ),
    );
  }
}

class TicTacToeScreen extends StatefulWidget {
  @override
  _TicTacToeScreenState createState() => _TicTacToeScreenState();
}

class _TicTacToeScreenState extends State<TicTacToeScreen> {
  List<List<String>> board = List.generate(3, (_) => List.filled(3, ''));
  bool isPlayerX = true;
  String resultText = '';

  void checkWinner() {
    // Проверяем по горизонтали, вертикали и диагоналям
    for (int i = 0; i < 3; i++) {
      if (board[i][0] != '' &&
          board[i][0] == board[i][1] &&
          board[i][1] == board[i][2]) {
        resultText = '${board[i][0]} выиграл!';
        return;
      }
    }

    for (int i = 0; i < 3; i++) {
      if (board[0][i] != '' &&
          board[0][i] == board[1][i] &&
          board[1][i] == board[2][i]) {
        resultText = '${board[0][i]} выиграл!';
        return;
      }
    }

    if (board[0][0] != '' &&
        board[0][0] == board[1][1] &&
        board[1][1] == board[2][2]) {
      resultText = '${board[0][0]} выиграл!';
      return;
    }

    if (board[0][2] != '' &&
        board[0][2] == board[1][1] &&
        board[1][1] == board[2][0]) {
      resultText = '${board[0][2]} выиграл!';
      return;
    }

    // Ничья
    if (!board.any((row) => row.any((cell) => cell == ''))) {
      resultText = 'Ничья!';
    }
  }

  void resetGame() {
    setState(() {
      board = List.generate(3, (_) => List.filled(3, ''));
      isPlayerX = true;
      resultText = '';
    });
  }

  void onCellTap(int row, int col) {
    if (board[row][col].isEmpty && resultText.isEmpty) {
      setState(() {
        board[row][col] = isPlayerX ? 'X' : 'O';
        isPlayerX = !isPlayerX;

        checkWinner();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Крестики-Нолики'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          for (int i = 0; i < 3; i++)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int j = 0; j < 3; j++)
                  GestureDetector(
                    onTap: () => onCellTap(i, j),
                    child: Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        border: Border.all(),
                      ),
                      child: Center(
                        child: Text(
                          board[i][j],
                          style: TextStyle(fontSize: 32),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          SizedBox(height: 20),
          Text(
            resultText,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: resetGame,
            child: Text('Новая игра'),
          ),
        ],
      ),
    );
  }
}
