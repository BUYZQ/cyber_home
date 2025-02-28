import 'package:cyber_app/widgets/my_drawer.dart';
import 'package:flutter/material.dart';

class AboutCompanyScreen extends StatefulWidget {
  const AboutCompanyScreen({super.key});

  @override
  State<AboutCompanyScreen> createState() => _AboutCompanyScreenState();
}

class _AboutCompanyScreenState extends State<AboutCompanyScreen> {

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      drawer: MyDrawer(currentScreen: 'О компании'),
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
                          'О компании',
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
                    margin: EdgeInsets.only(top: 15),
                    height: 200,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10),
                        topLeft: Radius.circular(10),
                      ),
                      color: theme.colorScheme.tertiaryFixed,
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
                    child: Text(
                      'О нашей компании CyberED',
                      style: theme.textTheme.titleSmall?.copyWith(
                        fontSize: 30,
                      ),
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
                    child: Text(
                      'Текст с рассказом что это за компания, чем она занимается и на чём специализируется. Рассмотрены цели и задачи это клмпании и т.д.',
                      style: theme.textTheme.labelSmall?.copyWith(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Container(
                    margin: EdgeInsets.all(20),
                    height: 180,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: theme.colorScheme.tertiaryFixed,
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
                    child: Text(
                      'Преподаватели в CyberED ',
                      style: theme.textTheme.titleSmall?.copyWith(
                        fontSize: 30,
                      ),
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
                    child: Text(
                      'Текст с расказом о преподавателях данной компании',
                      style: theme.textTheme.labelSmall?.copyWith(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
                    child: Text(
                      'Делаем то, что умеем',
                      style: theme.textTheme.titleSmall?.copyWith(
                        fontSize: 30,
                      ),
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
                    child: Text(
                      'Текст с расказом о то, что умеет компания.',
                      style: theme.textTheme.labelSmall?.copyWith(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Container(
                    margin: EdgeInsets.all(20),
                    height: 180,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: theme.colorScheme.tertiaryFixed,
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
                    child: Text(
                      'Знания, которые можно применить на пркатике',
                      style: theme.textTheme.titleSmall?.copyWith(
                        fontSize: 30,
                      ),
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
                    child: Text(
                      'Текст о том, как полученные знания применяются на практике в компании во время обечения',
                      style: theme.textTheme.labelSmall?.copyWith(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Container(
                    margin: EdgeInsets.all(20),
                    height: 180,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: theme.colorScheme.tertiaryFixed,
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
                    child: Text(
                      'Интеграция муждународного опыта',
                      style: theme.textTheme.titleSmall?.copyWith(
                        fontSize: 30,
                      ),
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
                    child: Text(
                      'Текст о том, что учитывается при проработке программ',
                      style: theme.textTheme.labelSmall?.copyWith(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
                    child: Text(
                      'Индивидуальный подход в обучении',
                      style: theme.textTheme.titleSmall?.copyWith(
                        fontSize: 30,
                      ),
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
                    child: Text(
                      'Текст о том, как комппания разрабатывает образовательную программу для решения различных задач',
                      style: theme.textTheme.labelSmall?.copyWith(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ],
            );
          }
      ),
    );
  }
}
