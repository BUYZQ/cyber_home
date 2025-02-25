import 'package:cyber_app/features/auth/widgets/my_select_button.dart';
import 'package:cyber_app/utils/validators.dart';
import 'package:cyber_app/widgets/my_button.dart';
import 'package:cyber_app/widgets/my_text_field.dart';
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
    return Form(
      key: _formKey,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              spacing: 10,
              children: [
                Text(
                  'Авторизация',
                  style: theme.textTheme.titleSmall?.copyWith(
                    fontSize: 40,
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
                    Material(
                      color: theme.colorScheme.tertiary,
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
                                    fontSize: 18,
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
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 55,
                              width: double.infinity,
                              child: MyButton(
                                backgroundColor: theme.colorScheme.surface,
                                foregroundColor: theme.colorScheme.onSurface,
                                title: 'Войти',
                                onPressed: () {
                                 if(_formKey.currentState!.validate()) {}
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 100),
                SizedBox(
                  height: 55,
                  width: double.infinity,
                  child: MyButton(
                    backgroundColor: theme.colorScheme.tertiary,
                    foregroundColor: theme.colorScheme.onSurface,
                    title: 'Регистрация',
                    onPressed: widget.toggleScreen,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
