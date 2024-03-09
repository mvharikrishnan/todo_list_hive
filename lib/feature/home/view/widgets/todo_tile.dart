import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list_hive/app_config/styles.dart';
import 'package:to_do_list_hive/app_config/theme.dart';
import 'package:to_do_list_hive/app_config/ui_helper.dart';
import 'package:to_do_list_hive/feature/AddAndEdit/controller/add_or_edit_controller.dart';
import 'package:to_do_list_hive/feature/home/model/todo_model.dart';
import 'package:intl/intl.dart';
import 'package:to_do_list_hive/app_config/routes.dart' as route;

class TodoTile extends StatelessWidget {
  const TodoTile({
    super.key,
    required this.toDo,
    required this.index,
  });

  final Note toDo;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onLongPress: () {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (ctx) => Material(
                  color: Colors.transparent,
                  child: AlertDialog(
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Do you want to delete Task?',
                          style: Styles.of(context).bodyStyle3.copyWith(
                              fontSize: 20, color: AppColours.primary),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () => Navigator.of(context).pop(),
                              child: Container(
                                height: 45,
                                width: 100,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(40),
                                    color: AppColours.cancelButtonColor),
                                alignment: Alignment.center,
                                child: Center(
                                  child: Text(
                                    'Cancel',
                                    style: Styles.of(context)
                                        .bodyStyle3
                                        .copyWith(
                                            fontSize: 14,
                                            color: AppColours.black),
                                  ),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () => context
                                  .read<AddEditController>()
                                  .deleteToDoList(index, context),
                              child: Container(
                                height: 45,
                                width: 100,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(40),
                                    color: AppColours.primary),
                                alignment: Alignment.center,
                                child: Center(
                                  child: Text(
                                    'Continue',
                                    style: Styles.of(context)
                                        .bodyStyle3
                                        .copyWith(
                                            fontSize: 14,
                                            color: AppColours.white),
                                  ),
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  )),
            );
          },
          child: Container(
            width: SizeConfig.screenWidth,
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: getStatusColor(toDo.taskStatus ?? '').withOpacity(0.3),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            toDo.taskTitle,
                            style: AppTheme()
                                .customTextNormal(
                                  AppColours.black,
                                  18,
                                )
                                .copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ],
                      ),
                      IconButton.outlined(
                        onPressed: () {
                          Navigator.of(context)
                              .pushNamed(route.kAddAndEditScreen, arguments: {
                            'isEdit': true,
                            'todo': toDo,
                            'index': index
                          });
                        },
                        icon: const Icon(Icons.edit_note_sharp),
                      ),
                    ],
                  ),
                  Row(
                    children: [Text(toDo.description ?? '')],
                  ),
                  vsBox1,
                  Row(
                    children: [Text('DUE: ${selectedDateTime(toDo.dueDate)}')],
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }

  String selectedDateTime(DateTime datetime) {
    String formattedDate = DateFormat('EEEE, dd').format(datetime);
    log("due date : $formattedDate");
    return formattedDate;
  }

  Color getStatusColor(String status) {
    switch (status) {
      case 'pending':
        return AppColours.orange;
      case 'completed':
        return AppColours.lightGreen2;
      case 'ongoing':
        return AppColours.lightBlue1;
      case 'failed':
        return AppColours.redColor;

      default:
        return AppColours.hintTextColor;
    }
  }
}
