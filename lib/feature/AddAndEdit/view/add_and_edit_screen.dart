
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list_hive/app_config/theme.dart';
import 'package:to_do_list_hive/app_config/ui_helper.dart';
import 'package:to_do_list_hive/feature/AddAndEdit/controller/add_or_edit_controller.dart';
import 'package:to_do_list_hive/feature/AddAndEdit/widget/custom_drop_down.dart';
import 'package:to_do_list_hive/feature/AddAndEdit/widget/custom_text_field.dart';
import 'package:to_do_list_hive/feature/home/model/todo_model.dart';
import 'package:to_do_list_hive/feature/widgets/common_submit_button.dart';
import 'package:to_do_list_hive/feature/widgets/custom_progress_indicator.dart';

class AddAndEditScreen extends StatefulWidget {
  const AddAndEditScreen(
      {super.key, required this.isEdit, this.todo, this.index});
  final bool isEdit;
  final Note? todo;
  final int? index;

  @override
  State<AddAndEditScreen> createState() => _AddAndEditScreenState();
}

class _AddAndEditScreenState extends State<AddAndEditScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (widget.todo != null) {
        context.read<AddEditController>().setEditableValues(widget.todo!);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.isEdit ? "EDIT TO-DO" : 'ADD TO-DO'),
      ),
      body: Consumer<AddEditController>(
        builder: (context, ref, child) {
          return ref.isLoading
              ? const CustomProgressIndicator(
                  color: AppColours.primary,
                )
              : SingleChildScrollView(
                  physics: ScrollPhysics(),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomTextField(
                          controller: ref.titleController,
                          title: 'Task Title',
                          hintText: 'Enter your task title',
                        ),
                        CustomTextField(
                          controller: ref.descController,
                          title: 'Description',
                          hintText: 'Enter your task description',
                        ),
                        vsBox1,
                        Text(
                          'Date Time',
                          style: AppTheme().customTextNormal(
                            AppColours.lightBlack,
                            18,
                          ),
                        ),
                        vsBox1,
                        InkWell(
                          onTap: () => ref.selectDate(context),
                          child: Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(60),
                                border: Border.all(color: AppColours.primary)),
                            alignment: Alignment.center,
                            child: ref.dateTimeController != null
                                ? Text(ref.selectedDateTime())
                                : Text('Select Date and Time'),
                          ),
                        ),
                        (widget.isEdit)
                            ? Column(
                                children: [
                                  CustomDropDownBox(
                                    selectedValue: ref.complitionStatus,
                                    title: "Status",
                                    hintText: 'Choose your task status',
                                    listValues: ref.status,
                                    ref: ref,
                                    onTap: (value) {
                                      ref.setStatus(value);
                                    },
                                  ),
                                ],
                              )
                            : const SizedBox()
                      ],
                    ),
                  ),
                );
        },
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.all(20),
        child: SizedBox(
          width: SizeConfig.screenWidth,
          child: Consumer<AddEditController>(
            builder: (context, ref, child) {
              return CustomTinyActionButton(
                title: widget.isEdit ? "Save Edit" : 'Save',
                onPressed: () => widget.isEdit
                    ? ref.editToDoList(widget.index ?? 0, context)
                    : ref.saveTodoList(context),
                isLoading: ref.isLoading,
              );
            },
          ),
        ),
      ),
    );
  }
}
