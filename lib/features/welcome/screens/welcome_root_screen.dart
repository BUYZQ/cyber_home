import 'package:cyber_app/features/welcome/screens/welcome_one_screen.dart';
import 'package:cyber_app/features/welcome/screens/welcome_three_screen.dart';
import 'package:cyber_app/features/welcome/screens/welcome_two_screen.dart';
import 'package:flutter/material.dart';

class WelcomeRootScreen extends StatefulWidget {
  const WelcomeRootScreen({super.key});

  @override
  State<WelcomeRootScreen> createState() => _WelcomeRootScreenState();
}

class _WelcomeRootScreenState extends State<WelcomeRootScreen> {

  final _pageController = PageController();
  int _currentPageIndex = 0;

  final List<Widget> _screens = [
    WelcomeOneScreen(),
    WelcomeTwoScreen(),
    WelcomeThreeScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          double horizontalPadding = 20.0;
          if (constraints.maxWidth > 800) {
            horizontalPadding = 250.0;
          } else if (constraints.maxWidth > 600) {
            horizontalPadding = 100.0;
          }
          return Stack(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                child: PageView(
                  controller: _pageController,
                  children: _screens,
                  onPageChanged: (index) {
                    setState(() {
                      _currentPageIndex = index;
                    });
                  },
                ),
              ),
              Center(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minWidth: constraints.maxHeight,
                    maxWidth: 600,
                  ),
                  child: Positioned(
                    bottom: 20,
                    left: 20,
                    right: 20,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Material(
                          borderRadius: BorderRadius.circular(100),
                          color: theme.colorScheme.tertiary,
                          child: InkWell(
                            borderRadius: BorderRadius.circular(100),
                            onTap: () {
                              _pageController.previousPage(
                                duration: Duration(milliseconds: 600),
                                curve: Curves.ease,
                              );
                            },
                            child: Container(
                              alignment: Alignment.center,
                              height: 60,
                              width: 60,
                              child:  Image.asset('images/сommon/icons/left.png'),
                            ),
                          ),
                        ),
                        Row(
                          spacing: 10,
                          children: [
                            ...List.generate(3, (index) {
                              return  CircleAvatar(
                                radius: 7,
                                backgroundColor: index == _currentPageIndex
                                    ? theme.colorScheme.tertiaryFixed
                                    : theme.colorScheme.tertiary,
                              );
                            }),
                          ],
                        ),
                        Material(
                          borderRadius: BorderRadius.circular(100),
                          color: theme.colorScheme.tertiary,
                          child: InkWell(
                            borderRadius: BorderRadius.circular(100),
                            onTap: () {
                              _pageController.nextPage(
                                duration: Duration(milliseconds: 600),
                                curve: Curves.ease,
                              );
                              if(_pageController.page == _screens.length - 1) {
                                Navigator.of(context).pushReplacementNamed('/auth');
                              }
                            },
                            child: Container(
                              alignment: Alignment.center,
                              height: 60,
                              width: 60,
                              child: Image.asset('images/сommon/icons/right.png')
                            ),
                          ),
                        ),
                      ],
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
