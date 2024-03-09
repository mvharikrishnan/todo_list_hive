import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list_hive/app_config/ui_helper.dart';
import 'package:to_do_list_hive/feature/home/controller/home_controller.dart';
import 'package:to_do_list_hive/feature/home/model/sub_tast_model.dart';
import 'package:to_do_list_hive/feature/home/model/todo_model.dart';
import 'package:to_do_list_hive/feature/home/view/widgets/todo_tile.dart';
import 'package:to_do_list_hive/app_config/routes.dart' as route;

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<HomeController>().getTodoItems();
    });
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("TO DO LIST"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(
                route.kAddAndEditScreen,
                arguments: {'isEdit': false},
              );
            },
            icon: const Icon(
              Icons.add_box_rounded,
            ),
          )
        ],
      ),
      body: Consumer<HomeController>(
        builder: (context, ref, child) {
          return ref.toDoList.isEmpty
              ? const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Text('Please Add Some todo list'),
                    )
                  ],
                )
              : ListView.separated(
                  itemBuilder: (context, index) {
                    Note todo = ref.toDoList[index];
                    return TodoTile(
                      toDo: todo,
                      index: index,
                    );
                  },
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 5,
                  ),
                  itemCount: ref.toDoList.length,
                );
        },
      ),
    );
  }
}
