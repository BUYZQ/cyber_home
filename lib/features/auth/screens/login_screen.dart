import 'package:cyber_app/features/auth/widgets/login_employee_block.dart';
import 'package:cyber_app/features/auth/widgets/login_student_block.dart';
import 'package:cyber_app/features/auth/widgets/my_select_button.dart';
import 'package:cyber_app/widgets/my_button.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  final Function() toggleScreen;

  const LoginScreen({
    super.key,
    required this.toggleScreen,
  });

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String _selected = 'Обучающийся';
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _onSelect(String title) {
    setState(() {
      _selected = title;
    });
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      height: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            const Color(0xFF1A088D),
            const Color(0xFF3314F1),
            const Color(0xFFFD6342),
          ],
          stops: [0.1, 0.3, 0.8],
        ),
      ),
      child: Form(
        key: _formKey,
        child: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) {
              double horizontalPadding = 20.0;
              if (constraints.maxWidth > 800) {
                horizontalPadding = 250.0;
              } else if (constraints.maxWidth > 600) {
                horizontalPadding = 100.0;
              }
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                child: SingleChildScrollView(
                  child: Center(
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        minHeight: constraints.maxHeight,
                        maxWidth: 600,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        spacing: 10,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Text(
                              'Авторизация',
                              style: theme.textTheme.titleSmall?.copyWith(
                                fontSize: 40,
                                color: theme.colorScheme.surface,
                              ),
                            ),
                          ),
                          SizedBox(height: 30),
                          Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: SizedBox(
                                      height: 60,
                                      child: MySelectButton(
                                        title: 'Обучающийся',
                                        isSelected: _selected == 'Обучающийся',
                                        onPressed: () => _onSelect('Обучающийся'),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: SizedBox(
                                      height: 60,
                                      child: MySelectButton(
                                        title: 'Сотрудник',
                                        isSelected: _selected == 'Сотрудник',
                                        onPressed: () => _onSelect('Сотрудник'),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              _selected == 'Обучающийся'
                                  ? LoginStudentBlock(
                                emailController: _emailController,
                                passwordController: _passwordController,
                                formKey: _formKey,
                              )
                                  : LoginEmployeeBlock(
                                emailController: _emailController,
                                passwordController: _passwordController,
                                formKey: _formKey,
                              ),
                            ],
                          ),
                          SizedBox(height: 100),
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: SizedBox(
                              height: 55,
                              width: double.infinity,
                              child: MyButton(
                                foregroundColor: theme.colorScheme.onSurface,
                                title: 'Регистрация',
                                onPressed: widget.toggleScreen,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}