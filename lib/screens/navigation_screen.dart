import 'package:flutter/material.dart';
import '../widgets/custom_button.dart';
import 'random_elements_screen.dart';
import 'second_screen.dart';
import 'interactive_animation_screen.dart'; // Импортируем новый экран

class NavigationScreen extends StatelessWidget {
  const NavigationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Тестовое приложение'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Добро пожаловать на главный экран!'),
            const SizedBox(height: 16.0),
            CustomButton(
              buttonText: 'Карточки с текстом',
              onPressed: () {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        const SecondScreen(),
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                      const begin = Offset(1.0, 0.0);
                      const end = Offset.zero;
                      const curve = Curves.easeInOut;

                      var tween = Tween(begin: begin, end: end)
                          .chain(CurveTween(curve: curve));

                      var offsetAnimation = animation.drive(tween);

                      return SlideTransition(
                        position: offsetAnimation,
                        child: child,
                      );
                    },
                  ),
                );
              },
            ),
            const SizedBox(height: 16.0),
            CustomButton(
              buttonText: 'Анимация с иконками и шейдером',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ShapesScreen(),
                  ),
                );
              },
            ),
            const SizedBox(height: 16.0),
            CustomButton(
              buttonText: 'Много элементов',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RandomElementsScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
