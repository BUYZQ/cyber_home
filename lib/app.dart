import 'package:cyber_app/features/home/screens/home_screen.dart';
import 'package:cyber_app/features/welcome/screens/welcome_screen.dart';
import 'package:cyber_app/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class CyberApp extends StatefulWidget {
  const CyberApp({super.key});

  @override
  State<CyberApp> createState() => _CyberAppState();
}

class _CyberAppState extends State<CyberApp> {
  final _supabaseClient = Supabase.instance.client;

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
        appBarTheme: AppBarTheme(
          backgroundColor: Color(0xff3314F1),
        ),
        colorScheme: ColorScheme.light(
          surface: Color(0xffFFFFFF),
          onSurface: Color(0xff000000),
          primary: Color(0xff3314F1),
          primaryFixed: Color(0xff1A088D),
          onPrimary: Color(0xffFFFFFF),
          tertiary: Color(0xffD9D9D9),
          tertiaryFixed: Color(0xff9B9B9B),
          secondary: Color(0xff8985A7),
          scrim: Color(0xffFD6342),
          error: Color(0xffFD6342),
        ),
        useMaterial3: true,
      ),
      home: _supabaseClient.auth.currentUser == null
          ? WelcomeScreen()
          : HomeScreen(),
      routes: routes,
    );
  }
}
