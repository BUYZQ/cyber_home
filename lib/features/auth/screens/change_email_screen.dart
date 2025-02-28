import 'dart:ui';

import 'package:cyber_app/utils/validators.dart';
import 'package:cyber_app/widgets/my_button.dart';
import 'package:cyber_app/widgets/my_text_field.dart';
import 'package:flutter/material.dart';

class ChangeEmailScreen extends StatefulWidget {

  const ChangeEmailScreen({
    super.key,
  });

  @override
  State<ChangeEmailScreen> createState() => _ChangeEmailScreenState();
}

class _ChangeEmailScreenState extends State<ChangeEmailScreen> {

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();

  bool _onClickButton = false;

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: LayoutBuilder(
        builder: (context, constraints) {
          double horizontalPadding = 0.0;
          if (constraints.maxWidth <= 600) {
            horizontalPadding = 20.0;
          }
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
                child: Padding(
                  padding: EdgeInsets.all(horizontalPadding),
                  child: Center(
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        minHeight: constraints.maxHeight,
                        maxWidth: 600
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        spacing: 10,
                        children: [
                          Text(
                            textAlign: TextAlign.center,
                            'Изменить адрес электронной почты',
                            style: theme.textTheme.titleSmall?.copyWith(
                              fontSize: 33,
                              color: theme.colorScheme.surface,
                            ),
                          ),
                          SizedBox(height: 30),
                          Column(
                            children: [
                              ClipRRect(
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
                                      borderRadius: BorderRadius.circular(20),
                                      child: Container(
                                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                                        child: Column(
                                          spacing: 20,
                                          children: [
                                            _onClickButton == false ?
                                            Column(
                                              spacing: 10,
                                              children: [
                                                Text(
                                                  textAlign: TextAlign.center,
                                                  'Введите прошлый адрес электронной почты или рабочий номер телефона',
                                                  style: theme.textTheme.bodySmall?.copyWith(
                                                    fontSize: 20,
                                                    color: theme.colorScheme.surface,
                                                  ),
                                                ),
                                                MyTextField(
                                                  controller: _emailController,
                                                  hint: 'Email',
                                                  validator: Validators.validateEmail,
                                                ),
                                              ],
                                            ) : Text(
                                              textAlign: TextAlign.center,
                                              ' Для продолжения подтвердите адреса эллектронных почты',
                                              style: theme.textTheme.bodySmall?.copyWith(
                                                fontSize: 20,
                                                color: theme.colorScheme.surface,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 55,
                                              width: double.infinity,
                                              child: MyButton(
                                                backgroundColor: theme.colorScheme.surface,
                                                foregroundColor: theme.colorScheme.onSurface,
                                                title: 'Подтвердить',
                                                onPressed: () {
                                                  if(_formKey.currentState!.validate()) {
                                                    setState(() {
                                                      _onClickButton = true;
                                                    });
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
                              title: 'Назад',
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        }
      ),
    );
  }
}
