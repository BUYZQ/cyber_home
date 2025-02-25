import 'package:flutter/material.dart';

class MySelectButton extends StatelessWidget {
  final String title;
  final Function() onPressed;
  final bool isSelected;

  const MySelectButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      decoration: BoxDecoration(
        color: isSelected ? theme.colorScheme.tertiary : theme.colorScheme.surface,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(15),
          topLeft: Radius.circular(15),
        ),
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          shadowColor: Colors.transparent,
          backgroundColor: Colors.transparent,
          foregroundColor: theme.colorScheme.onSurface,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(15),
              topLeft: Radius.circular(15),
            ),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          title,
          style: theme.textTheme.labelSmall?.copyWith(
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
