import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final Color? backgroundColor;
  final Color? foregroundColor;
  final double borderRadius;
  final Function()? onPressed;
  final String title;

  const MyButton({
    super.key,
    required this.title,
    this.onPressed,
    this.backgroundColor,
    this.foregroundColor,
    this.borderRadius = 15,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        backgroundColor: backgroundColor ?? theme.colorScheme.surface,
        foregroundColor: foregroundColor ?? theme.colorScheme.onPrimary,
      ),
      onPressed: onPressed,
      child: Text(
        title,
        style: theme.textTheme.labelSmall?.copyWith(
          fontSize: 18,
          color: foregroundColor,
        ),
      ),
    );
  }
}
