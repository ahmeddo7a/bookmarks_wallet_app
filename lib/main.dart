import 'package:bookmarks_wallet/core/components/resources/theme_manager/light_theme.dart';
import 'package:bookmarks_wallet/features/home/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';

import 'core/components/resources/route_manager.dart';
import 'core/services/cache_helper.dart';
import 'core/services/service_locator.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  ServiceLocator().init();
  await CacheHelper.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: lightTheme(),
      onGenerateRoute: RouteGenerator.getRoute,
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false,

    );
  }
}