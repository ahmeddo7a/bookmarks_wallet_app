import 'package:bookmarks_wallet/features/authentication/presentation/screens/login_screen.dart';
import 'package:bookmarks_wallet/features/authentication/presentation/screens/register_screen.dart';
import 'package:bookmarks_wallet/features/home/presentation/screens/add_categories_screen.dart';
import 'package:flutter/material.dart';

import '../../../features/splash/splash_screen.dart';

class Routes {
  static const String splashRoute = '/';
  static const String loginRoute = '/loginRoute';
  static const String registerRoute = '/registerRoute';
  static const String homeRoute = '/HomeRoute';
  static const String addCategoryRoute = '/addCategoryRoute';

}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case Routes.loginRoute:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case Routes.registerRoute:
        return MaterialPageRoute(builder: (_) => const RegisterScreen());
      case Routes.addCategoryRoute:
        return MaterialPageRoute(builder: (_) => const AddCategoriesScreen());

      // case Routes.studentHomeworkDetailsScreen:
      //   return MaterialPageRoute(builder: (_) {
      //     final args =
      //     settings.arguments as ScreenArguments<HomeworkEntity>;
      //     return StudentHomeworkDetailsScreen(homeworkEntity: args.data);
      //   });
      //
      // case Routes.addChildScreen:
      //   return MaterialPageRoute(builder: (_) => const AddChildScreen());
      default:
        return undefinedRoute();
    }
  }

  static Route<dynamic> undefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => const Scaffold(
        body: Center(child: Text('Undefined')),
      ),
    );
  }
}
