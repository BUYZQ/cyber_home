import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>  with TickerProviderStateMixin  {

  late AnimationController _controller;
  late Animation<Alignment> _animation;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat(reverse: true);

    _animation = Tween<Alignment>(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ).animate(_controller);

    Future.delayed(Duration(seconds: 4), () {
      Navigator.of(context).pushNamedAndRemoveUntil(
        '/welcome_home',
        (Route route) => false,
      );
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                double horizontalPadding = 20.0;
                if (constraints.maxWidth > 800) {
                  horizontalPadding = 250.0;
                } else if (constraints.maxWidth > 600) {
                  horizontalPadding = 100.0;
                }
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                  child: Center(
                    child: Image.asset(
                      'images/welcome/logo.png',
                      scale: 1.6,
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
