import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  final Function()? onTap;
  final bool readOnly;

  const SearchField({
    super.key,
    this.onTap,
    this.readOnly = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return TextField(
      onTap: onTap,
      readOnly: readOnly,
      cursorColor: theme.colorScheme.onSurface,
      decoration: InputDecoration(
        filled: true,
        fillColor: theme.colorScheme.surface,
        hintText: 'Поиск информации',
        hintStyle: TextStyle(
          color: theme.colorScheme.tertiaryFixed,
          fontSize: 18 ,
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 20),
        prefixIcon: Padding(
          padding: const EdgeInsets.only(left: 15),
          child: Image.asset(
            'images/home/search.png',
            scale: 1.6,
          ),
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
      ),
    );
  }
}
