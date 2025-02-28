import 'package:flutter/material.dart';

class MyDropdownField extends StatelessWidget {
  const MyDropdownField({
    super.key,
    required String? selectedGender,
    this.validator,
    required this.hint,
  }) : _selectedGender = selectedGender;

  final String? _selectedGender;
  final String hint;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return DropdownButtonFormField(
      validator: validator,
      hint: Text(
        hint,
        style: theme.textTheme.labelSmall?.copyWith(
          fontSize: 18,
          color: theme.colorScheme.secondary,
        ),
      ),
      decoration: InputDecoration(
        filled: true,
        contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 18),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(
            color: theme.colorScheme.tertiary,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(
            color: theme.colorScheme.tertiary,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(
            color: theme.colorScheme.error,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(
            color: theme.colorScheme.error,
          ),
        ),
      ),
      value: _selectedGender,
      items: [
        DropdownMenuItem(
          value: 'Женский',
          child: Text('Женский'),
        ),
        DropdownMenuItem(
          value: 'Мужской',
          child: Text('Мужской'),
        ),
      ],
      onChanged: (value) {},
    );
  }
}