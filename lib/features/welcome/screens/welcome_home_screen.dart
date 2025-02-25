import 'package:cyber_app/widgets/my_button.dart';
import 'package:flutter/material.dart';

class WelcomeHomeScreen extends StatelessWidget {
  const WelcomeHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: Center(
        child: Text(
          'ЛОГОТИП 2',
          style: theme.textTheme.titleSmall?.copyWith(
            fontSize: 60,
          ),
        ),
      ),
      bottomSheet: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          spacing: 15,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 55,
              width: double.infinity,
              child: MyButton(
                backgroundColor: theme.colorScheme.tertiary,
                foregroundColor: theme.colorScheme.onSurface,
                title: 'Продолжить',
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed('/welcome_root');
                },
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).pushReplacementNamed('/auth');
              },
              child: Text(
                'Перейти к регистрации/авторизации',
                style: theme.textTheme.labelSmall?.copyWith(
                  fontSize: 17,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
