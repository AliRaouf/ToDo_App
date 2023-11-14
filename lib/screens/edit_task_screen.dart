import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../blocs/task/task_cubit.dart';
import '../components/custom_button.dart';
import '../components/custom_text_field.dart';
import '../models/task_model.dart';

class EditTaskScreen extends StatefulWidget {
  EditTaskScreen({super.key, required this.task});

  final TaskModel task;

  @override
  State<EditTaskScreen> createState() => _EditTaskScreenState();
}

class _EditTaskScreenState extends State<EditTaskScreen> {
  DateTime? stDate;

  DateTime? endDate;

  @override
  Widget build(BuildContext context) {
    List<DropdownMenuEntry<String>> states = [
      DropdownMenuEntry(value: "New", label: "New"),
      DropdownMenuEntry(value: "In Progress", label: "In Progress"),
      DropdownMenuEntry(value: "Completed", label: "Completed"),
      DropdownMenuEntry(value: "OutDated", label: "OutDated")
    ];
    var cubit = TaskCubit.get(context);
    double screenheight = MediaQuery.of(context).size.height;
    double screenwidth = MediaQuery.of(context).size.width;
    var titleController = TextEditingController();
    var descriptionController = TextEditingController();
    var stDateController = TextEditingController();
    var endDateController = TextEditingController();
    var stateController = TextEditingController();
    return BlocConsumer<TaskCubit, TaskState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            leading: Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back_ios_new_outlined)),
            ),
            centerTitle: true,
            title: const Text("Edit Task"),
            backgroundColor: Colors.purpleAccent,
          ),
          body: ModalProgressHUD(
            inAsyncCall: cubit.isLoading,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16),
              child: (ListView(
                children: [
                  CustomTextField(
                    label: "Title",
                    controller: titleController,
                    icon: const Icon(Icons.title),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: CustomTextField(
                      label: "Description",
                      controller: descriptionController,
                      icon: const Icon(Icons.description),
                    ),
                  ),
                  CustomTextField(
                    label: "Start Date",
                    controller: stDateController,
                    icon: const Icon(Icons.timer_outlined),
                    onTap: () async {
                      stDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2023),
                          lastDate: DateTime(2024));
                      if (stDate != null) {
                        stDateController.text =
                            DateFormat.yMMMd().format(stDate!);
                      }
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: CustomTextField(
                      label: "End Date",
                      controller: endDateController,
                      icon: const Icon(Icons.timer_off_outlined),
                      onTap: () async {
                        endDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2023),
                            lastDate: DateTime(2024));
                        if (endDate != null) {
                          endDateController.text =
                              DateFormat.yMMMd().format(endDate!);
                        }
                      },
                    ),
                  ),
                  DropdownMenu<String>(
                      width: screenwidth * 0.97,
                      inputDecorationTheme: InputDecorationTheme(
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  const BorderSide(color: Colors.purpleAccent)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  const BorderSide(color: Colors.grey))),
                      label: Text(
                        "States",
                        style: TextStyle(color: Colors.grey[800]),
                      ),
                      controller: stateController,
                      dropdownMenuEntries: states,
                      initialSelection: widget.task.taskType,
                      onSelected: (value) {
                        stateController.text = value!;
                        print(stateController.text);
                      }),
                  Container(
                    margin: EdgeInsets.only(top: screenheight * 0.1),
                    child: CustomButton(
                        width: screenwidth * 0.5,
                        height: screenheight * 0.05,
                        onPressed: () {
                          widget.task.title = titleController.text;
                          widget.task.taskType = stateController.text;
                          widget.task.description = descriptionController.text;
                          widget.task.stDate = stDate ?? widget.task.stDate;
                          widget.task.endDate = endDate ?? widget.task.endDate;
                          widget.task.save();
                          cubit.getTasks();
                          cubit.getTasksLength();
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              duration: Duration(seconds: 2),
                              content: Text("Task Edited Successfully")));
                          Navigator.pop(context);
                        },
                        text: "Edit Task"),
                  )
                ],
              )),
            ),
          ),
        );
      },
    );
  }
}
