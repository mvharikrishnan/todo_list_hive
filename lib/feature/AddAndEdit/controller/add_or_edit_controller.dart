import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list_hive/app_config/constants.dart';
import 'package:to_do_list_hive/app_config/ui_helper.dart';
import 'package:to_do_list_hive/feature/home/controller/home_controller.dart';
import 'package:to_do_list_hive/feature/home/model/todo_model.dart';

class AddEditController extends ChangeNotifier {
  bool isLoading = false;
  TextEditingController descController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  DateTime? dateTimeController;
  String? complitionStatus;
  List<String> status = ['completed', 'pending', 'ongoing', 'failed'];
  Note? toDoNote;
  final Box<Note> noteBox = Hive.box(AppConstants().boxName);

  selectDate(BuildContext context) async {
    dateTimeController = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(), // Restrict to future dates only
      lastDate: DateTime(2025),
    );
    notifyListeners();
  }

  setEditableValues(Note todo) {
    makeLodingTrue();
    descController = TextEditingController(text: todo.description);
    titleController = TextEditingController(text: todo.taskTitle);
    complitionStatus = todo.taskStatus;
    dateTimeController = todo.dueDate;
    notifyListeners();
    makeLoadingFalse();
  }

  setStatus(String? value) {
    complitionStatus = value;
    notifyListeners();
  }

  String selectedDateTime() {
    String formattedDate =
        DateFormat('EEEE dd-MM-yyyy').format(dateTimeController!);
    return formattedDate;
  }

  makeLodingTrue() {
    isLoading = true;
    notifyListeners();
  }

  makeLoadingFalse() {
    isLoading = false;
    notifyListeners();
  }

  saveTodoList(BuildContext context) async {
    makeLodingTrue();
    final note = Note(
      titleController.text.trim(),
      descController.text.trim(),
      dateTimeController!,
      "pending",
      [],
    );
    await noteBox.add(note);
    Provider.of<HomeController>(context, listen: false).getTodoItems();
    ShowAlert.showStyledToast('Task Added', context);
    Navigator.of(context).pop();
    clearData();
    makeLoadingFalse();
  }

  editToDoList(int index, BuildContext context) async {
    makeLodingTrue();
    final note = Note(
      titleController.text.trim(),
      descController.text.trim(),
      dateTimeController!,
      complitionStatus,
      [],
    );
    await noteBox.putAt(index, note);
    Provider.of<HomeController>(context, listen: false).getTodoItems();
    ShowAlert.showStyledToast('Task Edited', context);
    Navigator.of(context).pop();
    clearData();
    makeLoadingFalse();
  }

  deleteToDoList(int index, BuildContext context) async {
    makeLodingTrue();
    await noteBox.deleteAt(index);
    Provider.of<HomeController>(context, listen: false).getTodoItems();
    ShowAlert.showStyledToast('Task Deleted', context);
    Navigator.of(context).pop();
    clearData();
    makeLoadingFalse();
  }

  clearData() {
    titleController.clear();
    descController.clear();
    complitionStatus = null;
    dateTimeController = null;
    notifyListeners();
  }
}
