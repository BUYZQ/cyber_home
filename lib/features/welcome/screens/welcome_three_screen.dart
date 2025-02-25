import 'package:flutter/material.dart';

class WelcomeThreeScreen extends StatelessWidget {
  const WelcomeThreeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(bottom: 130.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              'Заголовок',
              style: theme.textTheme.titleSmall?.copyWith(
                fontSize: 30,
              ),
            ),
            SizedBox(height: 10),
            Text(
              textAlign: TextAlign.center,
              'Текст с пояснением чем занимается компании и какие курсы преподаёт. Также пояснение что чем удобно и что даёт приложение',
              style: theme.textTheme.bodySmall?.copyWith(
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
