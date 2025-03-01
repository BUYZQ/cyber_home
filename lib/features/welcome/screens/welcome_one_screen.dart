import 'package:flutter/material.dart';

class WelcomeOneScreen extends StatelessWidget {
  const WelcomeOneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: Color(0xff1E0AA1),
      body: Stack(
        children: [
          Image.asset('images/app/background.png'),
          Padding(
            padding: const EdgeInsets.only(bottom: 130.0),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 0),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      textAlign: TextAlign.center,
                      'Курсы по кибербезопасности',
                      style: theme.textTheme.titleSmall?.copyWith(
                        fontSize: 30,
                        color: theme.colorScheme.surface,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      textAlign: TextAlign.center,
                      'Обучаем и повышаем профессиональный уровень ИБ специалистов',
                      style: theme.textTheme.bodySmall?.copyWith(
                        fontSize: 20,
                        color: theme.colorScheme.surface,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
