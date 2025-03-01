import 'package:flutter/material.dart';

class HistoryCard extends StatelessWidget {
  final bool isNotRead;
  final String imagePath;

  const HistoryCard({
    super.key,
    this.isNotRead = true,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        children: [
          InkWell(
            onTap: () {},
            borderRadius: BorderRadius.circular(100),
            child: Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                border: Border.all(
                  color: isNotRead ? theme.colorScheme.scrim : Colors.transparent ,
                  width: 3,
                ),
              ),
              child: Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Image.asset(imagePath),
              ),
            ),
          ),
          Text(
            'История',
            style: theme.textTheme.labelSmall?.copyWith(
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
