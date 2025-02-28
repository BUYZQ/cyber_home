import 'package:cyber_app/widgets/my_drawer.dart';
import 'package:flutter/material.dart';

class ContactDataScreen extends StatefulWidget {
  const ContactDataScreen({super.key});

  @override
  State<ContactDataScreen> createState() => _ContactDataScreenState();
}

class _ContactDataScreenState extends State<ContactDataScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      drawer: MyDrawer(currentScreen: 'Контакты'),
      body: Builder(
        builder: (context) {
          return CustomScrollView(
            slivers: [
              SliverAppBar(
                automaticallyImplyLeading: false,
                floating: false,
                pinned: true,
                scrolledUnderElevation: 0,
                expandedHeight: 80,
                title: Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          Scaffold.of(context).openDrawer();
                        },
                        icon: Image.asset(
                          'images/home/menu.png',
                          scale: 1.8,
                          color: theme.colorScheme.surface,
                        ),
                      ),
                      Text(
                        'Контактные данные',
                        style: theme.textTheme.titleSmall?.copyWith(
                          fontSize: 25,
                          color: theme.colorScheme.surface,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed('/settings');
                        },
                        icon: Image.asset(
                          'images/home/settings.png',
                          scale: 1.8,
                          color: theme.colorScheme.surface,
                        ),
                      ),
                    ],
                  ),
                ),
                bottom: PreferredSize(preferredSize: Size(10, 20), child: SizedBox()),
              ),
              SliverToBoxAdapter(
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.tertiary,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    spacing: 6,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Контакты',
                        style: theme.textTheme.titleSmall?.copyWith(
                          fontSize: 30,
                        ),
                      ),
                      Text(
                        '+7 495 181 00 79',
                        style: theme.textTheme.labelSmall?.copyWith(
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        'info@cyber-ed.ru',
                        style: theme.textTheme.labelSmall?.copyWith(
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        'Москва, Мясницкая улица, 24/7с1',
                        style: theme.textTheme.labelSmall?.copyWith(
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.tertiary,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    spacing: 6,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Мессенджеры',
                        style: theme.textTheme.titleSmall?.copyWith(
                          fontSize: 30,
                        ),
                      ),
                      Text(
                        'Телеграм: https://t.me/cyberedrussia',
                        style: theme.textTheme.labelSmall?.copyWith(
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
