import 'package:cyber_app/features/profile/screens/profile_edit_screen.dart';
import 'package:flutter/material.dart';

class EditField extends StatelessWidget {
  final TextEditingController controller;
  final bool isEdit;
  final bool readOnly;

  const EditField({
    super.key,
    this.isEdit = false,
    this.readOnly = true,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return TextField(
      controller: controller,
      readOnly: readOnly,
      decoration: InputDecoration(
        filled: true,
        fillColor: theme.colorScheme.tertiary,
        hintStyle: theme.textTheme.labelSmall?.copyWith(
          fontSize: 16,
          color: theme.colorScheme.tertiaryFixed,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Colors.transparent,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Colors.transparent,
          ),
        ),
        suffixIcon: isEdit
            ? InkWell(
                borderRadius: BorderRadius.circular(100),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProfileEditScreen(
                        controller: controller,
                      ),
                    ),
                  );
                },
                child: Image.asset(
                  'images/profile/edit_field.png',
                  scale: 1.4,
                ),
              )
            : SizedBox(),
      ),
    );
  }
}
