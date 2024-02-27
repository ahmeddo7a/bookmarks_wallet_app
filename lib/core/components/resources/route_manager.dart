import 'package:flutter/material.dart';

import '../../../features/splash/splash_screen.dart';

class Routes {
  static const String splashRoute = '/';
  static const String loginRoute = '/loginRoute';
  static const String registerRoute = '/registerRoute';
  static const String homeRoute = '/HomeRoute';

  //Parent
  static const String addChildScreen = '/addChildScreen';
  static const String childHomeworkDetailsScreen = '/childHomeworkDetailsScreen';


  //Teacher
  static const String teacherAddHomeWorkScreen = '/teacherAddHomeWorkScreen';
  static const String teacherHomeworkDetailsScreen =
      '/teacherHomeworkDetailsScreen';
  static const String studentHomeworkDetailsScreen =
      '/studentHomeworkDetailsScreen';
  static const String studentRatingScreen =
      '/studentRatingScreen';
  static const String behaviorDetailsScreen =
      '/behaviorDetailsScreen';
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashScreen());

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
