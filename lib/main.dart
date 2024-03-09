import 'dart:io';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list_hive/app_config/app_router.dart';
import 'package:to_do_list_hive/app_config/constants.dart';
import 'package:to_do_list_hive/app_config/theme.dart';
import 'package:to_do_list_hive/app_config/ui_helper.dart';
import 'package:to_do_list_hive/app_config/routes.dart' as route;
import 'package:to_do_list_hive/feature/AddAndEdit/controller/add_or_edit_controller.dart';
import 'package:to_do_list_hive/feature/home/controller/home_controller.dart';
import 'package:to_do_list_hive/feature/home/model/todo_model.dart';
import 'package:path_provider/path_provider.dart' as pathProvider;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (!Hive.isAdapterRegistered(NoteAdapter().typeId)) {
    Directory directory = await pathProvider.getApplicationDocumentsDirectory();
    Hive.init(directory.path);
    Hive.registerAdapter(NoteAdapter());
    await Hive.openBox<Note>(AppConstants().boxName);
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AddEditController(),
        ),
         ChangeNotifierProvider(
          create: (_) => HomeController(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        initialRoute: route.kSplashScreen,
        onGenerateRoute: AppRouter.onGenerateRoute,
        theme: ThemeData(
          fontFamily: 'Nunito',
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
          primaryColor: AppColours.primary,
          textSelectionTheme: const TextSelectionThemeData(
            cursorColor: AppColours.primary,
            selectionColor: AppColours.primary,
            selectionHandleColor: AppColours.primary,
          ),
        ),
      ),
    );
  }
}
