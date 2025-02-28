import 'package:cyber_app/widgets/my_drawer.dart';
import 'package:flutter/material.dart';

class LicenseScreen extends StatefulWidget {
  const LicenseScreen({super.key});

  @override
  State<LicenseScreen> createState() => _LicenseScreenState();
}

class _LicenseScreenState extends State<LicenseScreen> {
  int _currentScreen = 0;
  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      drawer: MyDrawer(currentScreen: 'Лицензия'),
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
                        'Лицензия',
                        style: theme.textTheme.titleSmall?.copyWith(
                          fontSize: 30,
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
                bottom: PreferredSize(
                    preferredSize: Size(10, 20), child: SizedBox()),
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
                    mainAxisSize: MainAxisSize.min,
                    spacing: 12,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Лицензия на образовательную деятельность',
                        style: theme.textTheme.titleSmall?.copyWith(
                          fontSize: 30,
                        ),
                      ),
                      Stack(
                        children: [
                          SizedBox(
                            height: 500,
                            child: PageView(
                              controller: _pageController,
                              onPageChanged: (index) {
                                setState(() {
                                  _currentScreen = index;
                                });
                              },
                              children: [
                                Container(
                                  margin: EdgeInsets.only(right: 10),
                                  decoration: BoxDecoration(
                                    color: theme.colorScheme.tertiaryFixed,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    color: theme.colorScheme.tertiaryFixed,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            left: 20,
                            right: 25,
                            bottom: 0,
                            top: 0,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: _currentScreen == 0
                                      ? MainAxisAlignment.end
                                      : MainAxisAlignment.start,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        if (_currentScreen == 0) {
                                          _pageController.nextPage(
                                            duration: Duration(milliseconds: 400),
                                            curve: Curves.ease,
                                          );
                                        } else {
                                          _pageController.previousPage(
                                            duration: Duration(milliseconds: 400),
                                            curve: Curves.ease,
                                          );
                                        }
                                      },
                                      child: Image.asset(
                                        _currentScreen == 0
                                            ? 'images/сommon/icons/right.png'
                                            : 'images/сommon/icons/left.png',
                                        scale: 1.5,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
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
