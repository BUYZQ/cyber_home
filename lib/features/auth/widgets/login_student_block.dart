import 'dart:developer';
import 'dart:ui';
import 'package:cyber_app/services/auth_service.dart';
import 'package:cyber_app/utils/validators.dart';
import 'package:cyber_app/widgets/my_button.dart';
import 'package:cyber_app/widgets/my_text_field.dart';
import 'package:flutter/material.dart';

class LoginStudentBlock extends StatefulWidget {
  const LoginStudentBlock({super.key});

  @override
  State<LoginStudentBlock> createState() => _LoginStudentBlockState();
}

class _LoginStudentBlockState extends State<LoginStudentBlock> {
  final _authService = AuthService();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Material(
      color: Colors.transparent,
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(20),
          bottomLeft: Radius.circular(20),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
            decoration: BoxDecoration(
              color: theme.colorScheme.surface,
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(20),
                bottomLeft: Radius.circular(20),
              ),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.white.withOpacity(0.2),
                  Colors.white.withOpacity(0.3),
                ],
              ),
            ),
            child: Form(
              key: _formKey,
              child: Column(
                spacing: 10,
                children: [
                  MyTextField(
                    controller: _emailController,
                    hint: 'Email',
                    validator: Validators.validateEmail,
                  ),
                  MyTextField(
                    controller: _passwordController,
                    hint: 'Password',
                    isPassword: true,
                    validator: Validators.validatePasswordComplexity,
                  ),
                  SizedBox(height: 30),
                  InkWell(
                    borderRadius: BorderRadius.circular(10),
                    onTap: () {
                      Navigator.of(context).pushNamed('/change_password');
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 6),
                      child: Text(
                        'Забыли пароль',
                        style: theme.textTheme.labelSmall?.copyWith(
                          fontSize: 20,
                          color: theme.colorScheme.surface,
                        ) ?? TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                  InkWell(
                    borderRadius: BorderRadius.circular(10),
                    onTap: () {
                      Navigator.of(context).pushNamed('/change_email');
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 6),
                      child: Text(
                        'Изменить адрес Эл. Почты',
                        style: theme.textTheme.labelSmall?.copyWith(
                          fontSize: 20,
                          color: theme.colorScheme.surface,
                        ) ?? TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  SizedBox(
                    height: 55,
                    width: double.infinity,
                    child: MyButton(
                      backgroundColor: theme.colorScheme.surface,
                      foregroundColor: theme.colorScheme.onSurface,
                      title: 'Войти',
                      onPressed: _signInStudent,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _signInStudent() async {
    if (_formKey.currentState!.validate()) {
      try {
        await _authService.signIn(
          email: _emailController.text,
          password: _passwordController.text,
        );
        Navigator.of(context).pushNamedAndRemoveUntil(
          '/home', (Route route) => false,
        );
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Неверные учетные данные.')),
        );
        log(e.toString());
      }
    }
  }
}
