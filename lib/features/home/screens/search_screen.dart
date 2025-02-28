import 'package:cyber_app/features/home/widgets/search_field.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              color: theme.colorScheme.primary,
              padding: EdgeInsets.all(6),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Image.asset(
                      'images/home/close.png',
                      scale: 1.8,
                      color: theme.colorScheme.surface,
                    ),
                  ),
                  Expanded(
                    child: SearchField(),
                  ),
                ],
              ),
            ),
            Expanded(child: SizedBox()),
            Text(
              textAlign: TextAlign.center,
              'Введите текст запсиси в\nстроку поиска',
              style: theme.textTheme.labelSmall?.copyWith(
                fontSize: 21,
              ),
            ),
            Expanded(child: SizedBox()),
          ],
        ),
      ),
    );
  }
}
