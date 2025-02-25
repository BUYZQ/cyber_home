import 'package:cyber_app/features/auth/widgets/employee_block.dart';
import 'package:cyber_app/features/auth/widgets/my_select_button.dart';
import 'package:cyber_app/features/auth/widgets/student_block.dart';
import 'package:cyber_app/widgets/my_button.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  final Function() toggleScreen;

  const RegisterScreen({
    super.key,
    required this.toggleScreen,
  });

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String _selectedStatus = 'Обучающийся';
  String? _selectedGender;

  final _formKey = GlobalKey<FormState>();

  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  final TextEditingController _workEmailController = TextEditingController();
  final TextEditingController _positionController = TextEditingController();
  DateTime? _selectedDate;

  void _onSelect(String title) {
    setState(() {
      _selectedStatus = title;
    });
  }

  @override
  void dispose() {
    _fullNameController.dispose();
    _dateController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _workEmailController.dispose();
    _positionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Form(
      key: _formKey,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              spacing: 10,
              children: [
                SizedBox(height: 10),
                Text(
                  'Регистрация',
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
                              isSelected: _selectedStatus == 'Обучающийся',
                              onPressed: () => _onSelect('Обучающийся'),
                            ),
                          ),
                        ),
                        Expanded(
                          child: SizedBox(
                            height: 60,
                            child: MySelectButton(
                              title: 'Сотрудник',
                              onPressed: () => _onSelect('Сотрудник'),
                              isSelected: _selectedStatus == 'Сотрудник',
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
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                        child: _selectedStatus == 'Обучающийся'
                            ? StudentBlock(
                                fullNameController: _fullNameController,
                                dateController: _dateController,
                                emailController: _emailController,
                                selectedGender: _selectedGender,
                                passwordController: _passwordController,
                                confirmPasswordController:
                                    _confirmPasswordController,
                                formKey: _formKey,
                                selectedDate: _selectedDate,
                                selectDate: _selectDate,
                              )
                            : EmployeeBlock(
                                fullNameController: _fullNameController,
                                dateController: _dateController,
                                emailController: _emailController,
                                selectedGender: _selectedGender,
                                passwordController: _passwordController,
                                confirmPasswordController: _confirmPasswordController,
                                workEmailController: _workEmailController,
                                positionController: _positionController,
                                formKey: _formKey,
                                selectedDate: _selectedDate,
                                selectDate: _selectDate,
                              ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30),
                SizedBox(
                  height: 55,
                  width: double.infinity,
                  child: MyButton(
                    backgroundColor: theme.colorScheme.tertiary,
                    foregroundColor: theme.colorScheme.onSurface,
                    title: 'Авторизация',
                    onPressed: widget.toggleScreen,
                  ),
                ),
                SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      setState(() {
        _selectedDate = picked;
        _dateController.text =
        '${picked.day.toString().padLeft(2, '0')}.${picked.month.toString().padLeft(2, '0')}.${picked.year}';
      });
    }
  }
}

