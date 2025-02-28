import 'package:flutter/material.dart';

class WelcomeOneScreen extends StatelessWidget {
  const WelcomeOneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: Center(
        child: LayoutBuilder(
          builder: (context, constraints) {
            double horizontalPadding = 20.0;
            if (constraints.maxWidth > 800) {
              horizontalPadding = 250.0;
            } else if (constraints.maxWidth > 600) {
              horizontalPadding = 100.0;
            }
            return Padding(
              padding: const EdgeInsets.only(bottom: 130.0),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: constraints.maxHeight,
                    maxWidth: 600,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        textAlign: TextAlign.center,
                        'Курсы по кибербезопасности',
                        style: theme.textTheme.titleSmall?.copyWith(
                          fontSize: 30,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        textAlign: TextAlign.center,
                        'Обучаем и повышаем профессиональный уровень ИБ специалистов',
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
        ),
      ),
    );
  }
}
