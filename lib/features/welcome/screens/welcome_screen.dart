import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 2), () {
      Navigator.of(context).pushNamedAndRemoveUntil(
        '/welcome_home',
        (Route route) => false,
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: Center(
        child: Text(
          'ЛОГОТИП 1',
          style: theme.textTheme.titleSmall?.copyWith(
            fontSize: 60,
          ),
        ),
      ),
    );
  }
}
