import 'dart:ui';

import 'package:cyber_app/utils/validators.dart';
import 'package:cyber_app/widgets/my_button.dart';
import 'package:cyber_app/widgets/my_text_field.dart';
import 'package:flutter/material.dart';

class LoginEmployeeBlock extends StatelessWidget {
  const LoginEmployeeBlock({
    super.key,
    required TextEditingController emailController,
    required TextEditingController passwordController,
    required GlobalKey<FormState> formKey,
  })  : _emailController = emailController,
        _passwordController = passwordController,
        _formKey = formKey;

  final TextEditingController _emailController;
  final TextEditingController _passwordController;
  final GlobalKey<FormState> _formKey;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ClipRRect(
      borderRadius: BorderRadius.only(
        bottomRight: Radius.circular(20),
        bottomLeft: Radius.circular(20),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
        child: Container(
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
                Colors.white.withValues(alpha: 0.2),
                Colors.white.withValues(alpha: 0.3),
              ],
            ),
          ),
          child: Material(
            color: Colors.transparent,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(0),
              bottomRight: Radius.circular(20),
              bottomLeft: Radius.circular(20),
            ),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
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
                        ),
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
                        ),
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
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          Navigator.of(context).pushNamedAndRemoveUntil(
                            '/home',
                            (Route route) => false,
                          );
                        }
                      },
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
}
