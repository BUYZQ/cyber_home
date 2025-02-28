import 'package:flutter/material.dart';

class WelcomeTwoScreen extends StatelessWidget {
  const WelcomeTwoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 130.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                textAlign: TextAlign.center,
                'Почему выбирают CyberED?',
                style: theme.textTheme.titleSmall?.copyWith(
                  fontSize: 30,
                ),
              ),
              SizedBox(height: 10),
              Text(
                textAlign: TextAlign.center,
                'Мы 7 лет обучаем на практике у лучших экспертов России',
                style: theme.textTheme.bodySmall?.copyWith(
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
