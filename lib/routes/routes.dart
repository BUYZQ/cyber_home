import 'package:cyber_app/features/auth/screens/auth_screen.dart';
import 'package:cyber_app/features/auth/screens/change_email_screen.dart';
import 'package:cyber_app/features/auth/screens/change_password_screen.dart';
import 'package:cyber_app/features/welcome/screens/welcome_home_screen.dart';
import 'package:cyber_app/features/welcome/screens/welcome_root_screen.dart';

final routes = {
  '/welcome_home': (context) => WelcomeHomeScreen(),
  '/welcome_root': (context) => WelcomeRootScreen(),
  '/auth': (context) => AuthScreen(),
  '/change_password': (context) => ChangePasswordScreen(),
  '/change_email': (context) => ChangeEmailScreen(),
};