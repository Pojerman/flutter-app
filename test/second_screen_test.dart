import 'package:flutter/material.dart';
import 'package:flutter_app/screens/second_screen.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('SecondScreen benchmark test', (WidgetTester tester) async {
    // Запускаем ваше приложение
    await tester.pumpWidget(const MaterialApp(home: SecondScreen()));
    // Начало измерения времени
    final Stopwatch stopwatch = Stopwatch()..start();
    // Выполнение действий на экране (например, добавление 5 элементов)
    for (int i = 0; i < 10; i++) {
      await tester.tap(find.byType(FloatingActionButton));
      await tester.pumpAndSettle(); // Дождитесь завершения анимации
    }
    // Завершение измерения времени
    stopwatch.stop();
    // Вывод результатов
    print(
        'Elapsed time for adding 5 items to SecondScreen: ${stopwatch.elapsedMilliseconds} ms');
  });
}
