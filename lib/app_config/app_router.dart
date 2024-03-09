import 'package:flutter/material.dart';
import 'package:to_do_list_hive/app_config/routes.dart' as route;
import 'package:to_do_list_hive/feature/AddAndEdit/view/add_and_edit_screen.dart';
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
      case route.kAddAndEditScreen:
        final arguments = settings.arguments as Map;
        return MaterialPageRoute(
          builder: (context) {
            return AddAndEditScreen(
              isEdit: arguments['isEdit'],
              todo: arguments['todo'],
              index: arguments['index'],
            );
          },
        );
    }
    return null;
  }
}
