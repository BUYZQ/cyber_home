import 'package:cyber_app/features/home/widgets/history_card.dart';
import 'package:cyber_app/widgets/my_drawer.dart';
import 'package:cyber_app/features/home/widgets/search_field.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  bool _isVisible = true;
  late ScrollController _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      if (_scrollController.offset > 100) {
        setState(() {
          _isVisible = false;
        });
      } else {
        setState(() {
          _isVisible = true;
        });
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  int _currentContent = 0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      drawer: MyDrawer(currentScreen: 'Главная'),
      body: Builder(
        builder: (context) {
          return Center(
            child: CustomScrollView(
              controller: _scrollController,
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
                          'Главная',
                          style: theme.textTheme.titleSmall?.copyWith(
                            fontSize: 38,
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
                SliverVisibility(
                  visible: _isVisible,
                  sliver: SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Material(
                        color: theme.colorScheme.tertiary,
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          padding: EdgeInsets.all(10),
                          width: double.infinity,
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        _currentContent = 0;
                                      });
                                    },
                                    child: Text(
                                      'Новости',
                                      style: theme.textTheme.labelSmall?.copyWith(
                                        fontSize: 18,
                                        color: _currentContent == 0
                                            ? theme.colorScheme.primary
                                            : theme.colorScheme.onSurface,
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        _currentContent = 1;
                                      });
                                    },
                                    child: Text(
                                      'Акции',
                                      style: theme.textTheme.labelSmall?.copyWith(
                                        fontSize: 18,
                                        color: _currentContent == 1
                                            ? theme.colorScheme.primary
                                            : theme.colorScheme.onSurface,
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        _currentContent = 2;
                                      });
                                    },
                                    child: Text(
                                      'Мероприятия',
                                      style: theme.textTheme.labelSmall?.copyWith(
                                        fontSize: 18,
                                        color: _currentContent == 2
                                            ? theme.colorScheme.primary
                                            : theme.colorScheme.onSurface,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: [
                                    HistoryCard(imagePath: 'images/persons/person_one.png'),
                                    HistoryCard(imagePath: 'images/persons/person_two.png'),
                                    HistoryCard(imagePath: 'images/persons/person_three.png'),
                                    HistoryCard(imagePath: 'images/persons/person_four.png'),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: SearchField(
                      readOnly: true,
                      onTap: () {
                        Navigator.of(context).pushNamed('/search');
                      },
                    ),
                  ),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                        (context, index) {
                      return Container(
                        margin: EdgeInsets.only(top: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: theme.colorScheme.tertiary,
                        ),
                        height: 300,
                      );
                    },
                    childCount: 10,
                  ),
                ),
              ],
            ),
          );
        }
      ),
    );
  }
}
