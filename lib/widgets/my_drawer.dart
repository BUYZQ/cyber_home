import 'package:cyber_app/providers/user_image_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyDrawer extends StatelessWidget {
  final String currentScreen;

  const MyDrawer({
    super.key,
    required this.currentScreen,
  });

  @override
  Widget build(BuildContext context) {
    final imageProvider = Provider.of<UserImageProvider>(context);
    final theme = Theme.of(context);
    return Drawer(
      child: Stack(
        children: [
          Column(
            children: [
              Container(
                height: 150,
                color: theme.colorScheme.primary,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(bottom: 10, left: 8),
                          child: IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Image.asset(
                              'images/home/close.png',
                              scale: 1.6,
                              color: theme.colorScheme.surface,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(height: 80),
              Text(
                'ФИО',
                style: theme.textTheme.labelSmall?.copyWith(
                  fontSize: 20,
                ),
              ),
              Text(
                'Обучающийся',
                style: theme.textTheme.labelSmall?.copyWith(
                  fontSize: 20,
                ),
              ),
              SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pushNamedAndRemoveUntil(
                              '/profile',
                              (Route route) => false,
                            );
                          },
                          child: Text(
                            'Профиль',
                            style: theme.textTheme.labelSmall?.copyWith(
                              fontSize: 18,
                              color: currentScreen == 'Профиль'
                                  ? theme.colorScheme.tertiaryFixed
                                  : theme.colorScheme.onSurface,
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pushNamedAndRemoveUntil(
                              '/about_company',
                              (Route route) => false,
                            );
                          },
                          child: Text(
                            'О компании',
                            style: theme.textTheme.labelSmall?.copyWith(
                              fontSize: 18,
                              color: currentScreen == 'О компании'
                                  ? theme.colorScheme.tertiaryFixed
                                  : theme.colorScheme.onSurface,
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pushNamedAndRemoveUntil(
                              '/courses',
                              (Route route) => false,
                            );
                          },
                          child: Text(
                            'Курсы',
                            style: theme.textTheme.labelSmall?.copyWith(
                              fontSize: 18,
                              color: currentScreen == 'Курсы'
                                  ? theme.colorScheme.tertiaryFixed
                                  : theme.colorScheme.onSurface,
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pushNamedAndRemoveUntil(
                              '/teachers',
                              (Route route) => false,
                            );
                          },
                          child: Text(
                            'Преподаватели',
                            style: theme.textTheme.labelSmall?.copyWith(
                              fontSize: 18,
                              color: currentScreen == 'Преподаватели'
                                  ? theme.colorScheme.tertiaryFixed
                                  : theme.colorScheme.onSurface,
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pushNamedAndRemoveUntil(
                              '/license',
                              (Route route) => false,
                            );
                          },
                          child: Text(
                            'Лицензия компании',
                            style: theme.textTheme.labelSmall?.copyWith(
                              fontSize: 18,
                              color: currentScreen == 'Лицензия'
                                  ? theme.colorScheme.tertiaryFixed
                                  : theme.colorScheme.onSurface,
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pushNamedAndRemoveUntil(
                              '/home',
                              (Route route) => false,
                            );
                          },
                          child: Text(
                            'Главная страница',
                            style: theme.textTheme.labelSmall?.copyWith(
                              fontSize: 18,
                              color: currentScreen == 'Главная'
                                  ? theme.colorScheme.tertiaryFixed
                                  : theme.colorScheme.onSurface,
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pushNamedAndRemoveUntil(
                              '/contact_data',
                              (Route route) => false,
                            );
                          },
                          child: Text(
                            'Контактные данные',
                            style: theme.textTheme.labelSmall?.copyWith(
                              fontSize: 18,
                              color: currentScreen == 'Контакты'
                                  ? theme.colorScheme.tertiaryFixed
                                  : theme.colorScheme.onSurface,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            top: 95,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 120,
                  width: 120,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: theme.colorScheme.surface,
                  ),
                  child: imageProvider.image == null
                      ? Icon(
                          Icons.person,
                          size: 100,
                          color: theme.colorScheme.primaryFixed,
                        )
                      : ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Image.file(
                            imageProvider.image!,
                            fit: BoxFit.fill,
                          ),
                        ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
