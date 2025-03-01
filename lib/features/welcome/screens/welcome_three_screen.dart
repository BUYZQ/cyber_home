import 'package:flutter/material.dart';

class WelcomeThreeScreen extends StatelessWidget {
  const WelcomeThreeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: Color(0xff211A72),
      body: Stack(
        children: [
          Image.asset('images/app/background3.png'),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 130.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    textAlign: TextAlign.center,
                    '3 уровня освоения профессий',
                    style: theme.textTheme.titleSmall?.copyWith(
                      fontSize: 30,
                      color: theme.colorScheme.surface,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    textAlign: TextAlign.center,
                    'Обучаем людей с разными базовыми знаниями и навыками',
                    style: theme.textTheme.bodySmall?.copyWith(
                      fontSize: 20,
                      color: theme.colorScheme.surface,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
