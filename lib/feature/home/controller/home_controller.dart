import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:to_do_list_hive/app_config/constants.dart';
import 'package:to_do_list_hive/feature/home/model/todo_model.dart';

class HomeController extends ChangeNotifier {
  bool isLoading = false;
  List<Note> _toDoList = <Note>[];
  List<Note> get toDoList => _toDoList;
  makeLodingTrue() {
    isLoading = true;
    notifyListeners();
  }

  getTodoItems() async {
    final box = await Hive.openBox<Note>(AppConstants().boxName);

    _toDoList = box.values.toList();

    notifyListeners();
  }

  makeLoadingFalse() {
    isLoading = false;
    notifyListeners();
  }
}
