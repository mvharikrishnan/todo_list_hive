import 'package:flutter/material.dart';
import 'package:to_do_list_hive/app_config/routes.dart' as route;
import 'package:to_do_list_hive/feature/home/view/home_screen.dart';
import 'package:to_do_list_hive/feature/splash/view/splash_screen.dart';

class AppRouter {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case route.kSplashScreen:
        return MaterialPageRoute(
          builder: (context) {
            return const SplashScreen();
          },
        );

      case route.kHomeScreen:
        return MaterialPageRoute(
          builder: (context) {
            return const HomeScreen();
          },
        );
    }
    return null;
  }
}
