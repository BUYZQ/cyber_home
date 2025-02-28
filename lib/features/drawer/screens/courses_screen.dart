import 'package:cyber_app/widgets/my_drawer.dart';
import 'package:flutter/material.dart';

class CoursesScreen extends StatefulWidget {
  const CoursesScreen({super.key});

  @override
  State<CoursesScreen> createState() => _CoursesScreenState();
}

class _CoursesScreenState extends State<CoursesScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      drawer: MyDrawer(currentScreen: 'Курсы'),
      body: Builder(
        builder: (context) {
          return CustomScrollView(
            slivers: [
              SliverAppBar(
                automaticallyImplyLeading: false,
                backgroundColor: theme.colorScheme.tertiaryFixed,
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
                        icon: Image.asset('images/home/menu.png', scale: 1.8),
                      ),
                      Text(
                        'Курсы',
                        style: theme.textTheme.titleSmall?.copyWith(
                          fontSize: 30,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed('/settings');
                        },
                        icon: Image.asset('images/home/settings.png', scale: 1.8),
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
                    color: theme.colorScheme.tertiaryFixed,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    spacing: 12,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Для тех, кто делает первые шаги (Бесплатный курс)',
                        style: theme.textTheme.titleSmall?.copyWith(
                          fontSize: 30,
                        ),
                      ),
                     Container(
                       height: 150,
                       decoration: BoxDecoration(
                         color: theme.colorScheme.tertiary,
                         borderRadius: BorderRadius.circular(10),
                       ),
                     ),
                      Container(
                        height: 150,
                        decoration: BoxDecoration(
                          color: theme.colorScheme.tertiary,
                          borderRadius: BorderRadius.circular(10),
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
                    color: theme.colorScheme.tertiaryFixed,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    spacing: 12,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Основной набор компетенций для специалистов по информационной безопасности уровня junior/middle',
                        style: theme.textTheme.titleSmall?.copyWith(
                          fontSize: 30,
                        ),
                      ),
                      Container(
                        height: 150,
                        decoration: BoxDecoration(
                          color: theme.colorScheme.tertiary,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      Container(
                        height: 150,
                        decoration: BoxDecoration(
                          color: theme.colorScheme.tertiary,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      Container(
                        height: 150,
                        decoration: BoxDecoration(
                          color: theme.colorScheme.tertiary,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      Container(
                        height: 150,
                        decoration: BoxDecoration(
                          color: theme.colorScheme.tertiary,
                          borderRadius: BorderRadius.circular(10),
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
                    color: theme.colorScheme.tertiaryFixed,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    spacing: 12,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Дополнительные знания и глубокие компетенции для специалистов уровня middle+/senior ',
                        style: theme.textTheme.titleSmall?.copyWith(
                          fontSize: 30,
                        ),
                      ),
                      Container(
                        height: 150,
                        decoration: BoxDecoration(
                          color: theme.colorScheme.tertiary,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      Container(
                        height: 150,
                        decoration: BoxDecoration(
                          color: theme.colorScheme.tertiary,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      Container(
                        height: 150,
                        decoration: BoxDecoration(
                          color: theme.colorScheme.tertiary,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      Container(
                        height: 150,
                        decoration: BoxDecoration(
                          color: theme.colorScheme.tertiary,
                          borderRadius: BorderRadius.circular(10),
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
