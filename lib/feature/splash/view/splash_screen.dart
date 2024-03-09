import 'package:flutter/material.dart';
import 'package:to_do_list_hive/app_config/routes.dart' as route;

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    initRoute();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Container(child: Text("Splash Screen")),
    ));
  }

  initRoute() async {
    //navigate to login screen
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.of(context).pushReplacementNamed(route.kHomeScreen);
    });
  }
}
