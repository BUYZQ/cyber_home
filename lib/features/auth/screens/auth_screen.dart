import 'package:cyber_app/features/auth/screens/login_screen.dart';
import 'package:cyber_app/features/auth/screens/register_screen.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {

  bool _isLogin = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: _isLogin
          ? LoginScreen(toggleScreen: _toggleScreen)
          : RegisterScreen(toggleScreen: _toggleScreen),
    );
  }

  void _toggleScreen() {
    setState(() {
      _isLogin = !_isLogin;
    });
  }
}
