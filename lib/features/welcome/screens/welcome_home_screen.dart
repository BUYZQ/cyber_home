import 'package:cyber_app/widgets/my_button.dart';
import 'package:flutter/material.dart';

class WelcomeHomeScreen extends StatefulWidget {
  const WelcomeHomeScreen({super.key});

  @override
  State<WelcomeHomeScreen> createState() => _WelcomeHomeScreenState();
}

class _WelcomeHomeScreenState extends State<WelcomeHomeScreen>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Alignment> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )..repeat(reverse: true);

    _animation = Tween<Alignment>(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: _animation.value,
                end: Alignment.bottomRight,
                colors: [
                  const Color(0xFF1A088D),
                  const Color(0xFF3314F1),
                  const Color(0xFFFD6342),
                ],
                stops: [0.1, 0.3, 0.8],
              ),
            ),
            child: LayoutBuilder(
              builder: (context, constraints) {
                double horizontalPadding = 0.0;
                if (constraints.maxWidth <= 600) {
                  horizontalPadding = 20.0;
                }
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                  child: Center(
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        maxHeight: constraints.maxHeight,
                        maxWidth: 600,
                      ),
                      child: Column(
                        children: [
                          SizedBox(height: 100),
                          Text(
                            textAlign: TextAlign.center,
                            'Добро пожаловать',
                            style: theme.textTheme.titleSmall?.copyWith(
                              fontSize: 35,
                              color: theme.colorScheme.surface,
                            ),
                          ),
                          Expanded(
                            child: Center(
                              child: Image.asset(
                                'images/welcome/home_logo.png',
                                scale: 1.6,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(20),
                            child: Column(
                              spacing: 15,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SizedBox(
                                  height: 55,
                                  width: double.infinity,
                                  child: MyButton(
                                    backgroundColor: theme.colorScheme.surface,
                                    foregroundColor: theme.colorScheme.onSurface,
                                    title: 'Продолжить',
                                    onPressed: () {
                                      Navigator.of(context)
                                          .pushReplacementNamed('/welcome_root');
                                    },
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.of(context).pushReplacementNamed('/auth');
                                  },
                                  child: Text(
                                    'Перейти к регистрации/авторизации',
                                    style: theme.textTheme.labelSmall?.copyWith(
                                      fontSize: 17,
                                      color: theme.colorScheme.surface
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }
            ),
          );
        },
      ),
    );
  }
}
