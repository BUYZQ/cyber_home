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
      body: Form(
        key: _formKey,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              spacing: 10,
              children: [
                Text(
                  textAlign: TextAlign.center,
                  'Изменить адрес электронной почты',
                  style: theme.textTheme.titleSmall?.copyWith(
                    fontSize: 33,
                  ),
                ),
                SizedBox(height: 30),
                Column(
                  children: [
                    Material(
                      color: theme.colorScheme.tertiary,
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
    );
  }
}
