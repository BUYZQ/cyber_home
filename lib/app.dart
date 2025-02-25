import 'package:cyber_app/features/welcome/screens/welcome_screen.dart';
import 'package:cyber_app/routes/routes.dart';
import 'package:flutter/material.dart';

class CyberApp extends StatelessWidget {
  const CyberApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cyber Home',
      theme: ThemeData(
        textTheme: TextTheme(
          labelSmall: TextStyle(
            fontFamily: 'Helvetica',
            fontWeight: FontWeight.w400,
          ),
          titleSmall: TextStyle(
            fontFamily: 'Neue',
            fontWeight: FontWeight.w500,
          ),
          bodySmall: TextStyle(
            fontFamily: 'Helvetica',
            fontWeight: FontWeight.w400,
          ),
        ),
        colorScheme: ColorScheme.light(
          surface: Color(0xffFFFFFF),
          onSurface: Color(0xff000000),
          primary: Color(0xff008dff),
          onPrimary: Color(0xffFFFFFF),
          tertiary: Color(0xffD9D9D9),
          tertiaryFixed: Color(0xff9B9B9B),
          error: Color(0xffFD6342),
        ),
        useMaterial3: true,
      ),
      home: WelcomeScreen(),
      routes: routes,
    );
  }
}