import 'package:cyber_app/features/auth/widgets/select_date_field.dart';
import 'package:cyber_app/utils/validators.dart';
import 'package:cyber_app/widgets/my_button.dart';
import 'package:cyber_app/widgets/my_dropdown_field.dart';
import 'package:cyber_app/widgets/my_text_field.dart';
import 'package:flutter/material.dart';

class EmployeeBlock extends StatelessWidget {
  const EmployeeBlock({
    super.key,
    required TextEditingController fullNameController,
    required TextEditingController dateController,
    required TextEditingController emailController,
    required String? selectedGender,
    required TextEditingController passwordController,
    required TextEditingController confirmPasswordController,
    required GlobalKey<FormState> formKey,
    required DateTime? selectedDate,
    required this.selectDate,
    required TextEditingController workEmailController,
    required TextEditingController positionController,
  })  : _fullNameController = fullNameController,
        _dateController = dateController,
        _emailController = emailController,
        _selectedGender = selectedGender,
        _passwordController = passwordController,
        _confirmPasswordController = confirmPasswordController,
        _workEmailController = workEmailController,
        _positionController = positionController,
        _formKey = formKey,
        _selectedDate = selectedDate;

  final TextEditingController _fullNameController;
  final TextEditingController _dateController;
  final TextEditingController _emailController;
  final String? _selectedGender;
  final TextEditingController _passwordController;
  final TextEditingController _confirmPasswordController;
  final TextEditingController _workEmailController;
  final TextEditingController _positionController;
  final GlobalKey<FormState> _formKey;
  final DateTime? _selectedDate;
  final Function(BuildContext) selectDate;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      spacing: 10,
      children: [
        MyTextField(
          controller: _fullNameController,
          hint: 'ФИО',
          validator: Validators.validateEmpty,
        ),
        SelectDateField(
          controller: _dateController,
          hint: _selectedDate?.toIso8601String() ?? 'Дата рождения',
          selectDate: selectDate,
          validator: Validators.validateEmpty,
        ),
        MyDropdownField(
          hint: 'Пол',
          selectedGender: _selectedGender,
          validator: Validators.validateEmpty,
        ),
        MyTextField(
          controller: _emailController,
          hint: 'Личный Email',
          validator: Validators.validateEmail,
        ),
        MyTextField(
          controller: _workEmailController,
          hint: 'Корпоротивный Email',
          validator: Validators.validateEmail,
        ),
        MyTextField(
          controller: _positionController,
          hint: 'Должность руководитель',
          validator: Validators.validateEmail,
        ),
        MyTextField(
          controller: _passwordController,
          hint: 'Пароль',
          isPassword: true,
          validator: (value) => Validators.validatePasswordComplexityAndConfirm(
            value,
            _passwordController.text,
            _confirmPasswordController.text,
          ),
        ),
        MyTextField(
          controller: _confirmPasswordController,
          hint: 'Подвердите пароль',
          isPassword: true,
          validator: (value) => Validators.validatePasswordComplexityAndConfirm(
            value,
            _passwordController.text,
            _confirmPasswordController.text,
          ),
        ),
        SizedBox(height: 30),
        SizedBox(
          height: 55,
          width: double.infinity,
          child: MyButton(
            backgroundColor: theme.colorScheme.surface,
            foregroundColor: theme.colorScheme.onSurface,
            title: 'Войти',
            onPressed: () {
              if (_formKey.currentState!.validate()) {}
            },
          ),
        ),
      ],
    );
  }
}
