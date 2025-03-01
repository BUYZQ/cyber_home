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
      body: LayoutBuilder(builder: (context, constraints) {
        return Stack(
          children: [
            PageView(
              controller: _pageController,
              children: _screens,
              onPageChanged: (index) {
                setState(() {
                  _currentPageIndex = index;
                });
              },
            ),
            Positioned(
              bottom: 20,
              left: 20,
              right: 20,
              child: Center(
                child: Container(
                  constraints: const BoxConstraints(maxWidth: 500),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      InkWell(
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
                          child: Image.asset('images/welcome/to_left.png'),
                        ),
                      ),
                      Row(
                        spacing: 10,
                        children: [
                          ...List.generate(3, (index) {
                            return CircleAvatar(
                              radius: 7,
                              backgroundColor: index == _currentPageIndex
                                  ? theme.colorScheme.scrim
                                  : theme.colorScheme.surface,
                            );
                          }),
                        ],
                      ),
                      InkWell(
                        borderRadius: BorderRadius.circular(100),
                        onTap: () {
                          _pageController.nextPage(
                            duration: Duration(milliseconds: 600),
                            curve: Curves.ease,
                          );
                          if (_pageController.page == _screens.length - 1) {
                            Navigator.of(context).pushReplacementNamed('/auth');
                          }
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: 60,
                          width: 60,
                          child: Image.asset('images/welcome/to_right.png'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
