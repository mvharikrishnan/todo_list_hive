import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:to_do_list_hive/app_config/constants.dart';
import 'package:to_do_list_hive/app_config/routes.dart' as route;
import 'package:to_do_list_hive/app_config/theme.dart';
import 'package:to_do_list_hive/app_config/ui_helper.dart';

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

  initRoute() async {
    log("message");
    //navigate to login screen
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.of(context).pushReplacementNamed(route.kHomeScreen);
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        // backgroundColor: AppColours.splashBackgroundColor,
        body: Center(
          child: Lottie.asset(
            AppConstants().splashAnimation,
            height: SizeConfig.screenHeight,
            width: SizeConfig.screenWidth,
            fit: BoxFit.contain,
          ),
        ));
  }
}
