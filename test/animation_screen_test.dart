import 'package:flutter/material.dart';
import 'package:flutter_app/screens/interactive_animation_screen.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('ShapesScreen animation test', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: ShapesScreen()));
    // Проверяем, что экран загрузился успешно
    expect(find.byType(Scaffold), findsOneWidget);
    expect(find.text('Анимация с иконками и шейдером'), findsOneWidget);
    // Проверяем, что есть FloatingActionButton для управления анимацией
    expect(find.byType(FloatingActionButton), findsOneWidget);
    // Нажимаем на FloatingActionButton, чтобы запустить анимацию
    await tester.tap(find.byType(FloatingActionButton));
    await tester.pump();
    // Выводим сообщение об успешном запуске анимации
    print('Animation started successfully');
    // Проверяем, что анимация запустилась
    expect(
        tester
            .widget<FloatingActionButton>(find.byType(FloatingActionButton))
            .child,
        isNot(const Icon(Icons.play_arrow)),
        reason: 'Animation did not start properly');
    // Запоминаем время начала анимации
    final startTime = DateTime.now();
    // Ждем 5 секунд (длительность анимации)
    await tester.pump(const Duration(seconds: 5));
    // Проверяем, что анимация остановилась
    // Ожидаемый виджет Icon
    expect(
        tester
            .widget<FloatingActionButton>(find.byType(FloatingActionButton))
            .child,
        isNot(Icon(Icons.play_arrow)));
    // Вычисляем время, прошедшее с начала анимации до её окончания
    final endTime = DateTime.now();
    final elapsedTime = endTime.difference(startTime).inMilliseconds;
    // Выводим время выполнения анимации
    print('Animation stopped. Elapsed time: $elapsedTime ms');
  });
}
