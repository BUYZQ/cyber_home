import 'package:flutter/material.dart';

class MyTextField extends StatefulWidget {
  final TextEditingController controller;
  final String hint;
  final bool isPassword;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;

  const MyTextField({
    super.key,
    required this.hint,
    this.isPassword = false,
    this.validator,
    required this.controller,
    this.onChanged,
  });

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  bool _showPassword = false;
  bool _isPassword = false;

  @override
  void initState() {
    if (widget.isPassword) {
      _showPassword = true;
      _isPassword = true;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return TextFormField(
      controller: widget.controller,
      cursorColor: theme.colorScheme.onSurface,
      obscureText: _showPassword,
      validator: widget.validator,
      onChanged: widget.onChanged,
      decoration: InputDecoration(
        suffixIcon: _isPassword
            ? IconButton(
                onPressed: _showPasswordPressed,
                icon: _showPassword
                    ? Image.asset('images/сommon/icons/eye.png')
                    : Image.asset('images/сommon/icons/eye_close.png'),
              )
            : SizedBox(),
        hintText: widget.hint,
        hintStyle: theme.textTheme.labelSmall?.copyWith(
          fontSize: 18,
          color: theme.colorScheme.secondary,
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
    );
  }

  void _showPasswordPressed() {
    setState(() {
      _showPassword = !_showPassword;
    });
  }
}
