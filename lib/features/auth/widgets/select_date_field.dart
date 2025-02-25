import 'package:flutter/material.dart';

class SelectDateField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final Function(BuildContext context) selectDate;
  final String? Function(String?)? validator;

  const SelectDateField({
    super.key,
    required this.hint,
    required this.selectDate,
    required this.controller,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: () => selectDate(context),
      child: AbsorbPointer(
        child: TextFormField(
          controller: controller,
          validator: validator,
          readOnly: true,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(
              color: theme.colorScheme.tertiary,
            ),
            filled: true,
            contentPadding: EdgeInsets.all(20),
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
        ),
      ),
    );
  }
}
