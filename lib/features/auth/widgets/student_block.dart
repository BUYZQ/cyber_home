import 'dart:developer';
import 'package:cyber_app/features/auth/widgets/select_date_field.dart';
import 'package:cyber_app/services/auth_service.dart';
import 'package:cyber_app/utils/validators.dart';
import 'package:cyber_app/widgets/my_button.dart';
import 'package:cyber_app/widgets/my_dropdown_field.dart';
import 'package:cyber_app/widgets/my_text_field.dart';
import 'package:flutter/material.dart';

class StudentBlock extends StatefulWidget {
  StudentBlock({
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
  })  : _fullNameController = fullNameController,
        _dateController = dateController,
        _emailController = emailController,
        _selectedGender = selectedGender,
        _passwordController = passwordController,
        _confirmPasswordController = confirmPasswordController,
        _formKey = formKey,
        _selectedDate = selectedDate;

  final TextEditingController _fullNameController;
  final TextEditingController _dateController;
  final TextEditingController _emailController;
  String? _selectedGender;
  final TextEditingController _passwordController;
  final TextEditingController _confirmPasswordController;
  final GlobalKey<FormState> _formKey;
  final DateTime? _selectedDate;
  final Function(BuildContext) selectDate;

  @override
  State<StudentBlock> createState() => _StudentBlockState();
}

class _StudentBlockState extends State<StudentBlock> {

  final _authService = AuthService();

  @override
  void dispose() {
    widget._passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      spacing: 10,
      children: [
        MyTextField(
          controller: widget._fullNameController,
          hint: 'ФИО',
          validator: Validators.validateEmpty,
        ),
        SelectDateField(
          controller: widget._dateController,
          hint: widget._selectedDate?.toIso8601String() ?? 'Дата рождения',
          selectDate: widget.selectDate,
          validator: Validators.validateEmpty,
        ),
        MyTextField(
          controller: widget._emailController,
          hint: 'Email',
          validator: Validators.validateEmail,
        ),
        MyDropdownField(
          onChanged: (value) {
            setState(() {
              widget._selectedGender = value;
            });
          },
          hint: 'Пол',
          selectedGender: widget._selectedGender,
          validator: Validators.validateEmpty,
        ),
        MyTextField(
          controller: widget._passwordController,
          hint: 'Пароль',
          isPassword: true,
          validator: (value) => Validators.validatePasswordComplexityAndConfirm(
            value,
            widget._passwordController.text,
            widget._confirmPasswordController.text,
          ),
        ),
        MyTextField(
          controller: widget._confirmPasswordController,
          hint: 'Подвердите пароль',
          isPassword: true,
          validator: (value) => Validators.validatePasswordComplexityAndConfirm(
            value,
            widget._passwordController.text,
            widget._confirmPasswordController.text,
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
            onPressed: _signUpStudent
          ),
        ),
      ],
    );
  }

  Future<void> _signUpStudent() async {
    if(widget._formKey.currentState!.validate()) {
      try {
        await _authService.registerStudent(
          email: widget._emailController.text,
          password: widget._passwordController.text,
          fullName: widget._fullNameController.text,
          birthdate: widget._selectedDate!.toIso8601String(),
          gender: widget._selectedGender!,
          isAdmin: false,
        );
        log('Auth success');
        Navigator.of(context).pushNamedAndRemoveUntil(
          '/home',
          (Route route) => false,
        );
      } catch(e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(e.toString())),
        );
        log(e.toString());
      }
    }
  }
}
