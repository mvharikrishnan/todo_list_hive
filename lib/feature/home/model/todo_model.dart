import 'package:hive/hive.dart';
import 'package:to_do_list_hive/feature/home/model/sub_tast_model.dart';

part 'todo_model.g.dart';

@HiveType(typeId: 0)
class Note {
  @HiveField(0)
  final String taskTitle;

  @HiveField(1)
  final String? description;

  @HiveField(2)
  final DateTime dueDate;

  @HiveField(3)
  final String? taskStatus;

  @HiveField(4)
  final List<SubTask>? subTaskList;

  Note(
    this.taskTitle,
    this.description,
    this.dueDate,
    this.taskStatus,
    this.subTaskList,
  );
}
