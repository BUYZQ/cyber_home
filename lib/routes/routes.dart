import 'package:cyber_app/features/auth/screens/auth_screen.dart';
import 'package:cyber_app/features/auth/screens/change_email_screen.dart';
import 'package:cyber_app/features/auth/screens/change_password_screen.dart';
import 'package:cyber_app/features/drawer/screens/about_company_screen.dart';
import 'package:cyber_app/features/drawer/screens/contact_data_screen.dart';
import 'package:cyber_app/features/drawer/screens/courses_screen.dart';
import 'package:cyber_app/features/drawer/screens/license_screen.dart';
import 'package:cyber_app/features/drawer/screens/teachers_screen.dart';
import 'package:cyber_app/features/home/screens/home_screen.dart';
import 'package:cyber_app/features/home/screens/search_screen.dart';
import 'package:cyber_app/features/profile/screens/profile_edit_screen.dart';
import 'package:cyber_app/features/profile/screens/profile_screeen.dart';
import 'package:cyber_app/features/settings/screens/settings_screen.dart';
import 'package:cyber_app/features/welcome/screens/welcome_home_screen.dart';
import 'package:cyber_app/features/welcome/screens/welcome_root_screen.dart';

final routes = {
  '/welcome_home': (context) => WelcomeHomeScreen(),
  '/welcome_root': (context) => WelcomeRootScreen(),
  '/auth': (context) => AuthScreen(),
  '/change_password': (context) => ChangePasswordScreen(),
  '/change_email': (context) => ChangeEmailScreen(),
  '/home': (context) => HomeScreen(),
  '/search': (context) => SearchScreen(),
  '/teachers': (context) => TeachersScreen(),
  '/about_company': (context) => AboutCompanyScreen(),
  '/contact_data': (context) => ContactDataScreen(),
  '/courses': (context) => CoursesScreen(),
  '/license': (context) => LicenseScreen(),
  '/profile': (context) => ProfileScreen(),
  '/settings': (context) => SettingsScreen(),
};