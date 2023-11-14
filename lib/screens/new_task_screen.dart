import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks_app/blocs/task/task_cubit.dart';
import 'package:tasks_app/components/custom_button.dart';
import 'package:tasks_app/components/custom_text_field.dart';
import 'package:intl/intl.dart';
import 'package:tasks_app/models/task_model.dart';
import 'package:tasks_app/screens/tasks_screen.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class NewTaskScreen extends StatefulWidget {
  const NewTaskScreen({super.key});

  @override
  State<NewTaskScreen> createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends State<NewTaskScreen> {
  DateTime? stDate;
  DateTime? endDate;

  @override
  Widget build(BuildContext context) {
    var cubit = TaskCubit.get(context);
    double screenheight = MediaQuery.of(context).size.height;
    double screenwidth = MediaQuery.of(context).size.width;
    var titleController = TextEditingController();
    var descriptionController = TextEditingController();
    var stDateController = TextEditingController();
    var endDateController = TextEditingController();
    return BlocConsumer<TaskCubit, TaskState>(
      listener: (context, state) {
        if (state is CreateTaskSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              duration: Duration(seconds: 2),
              content: Text("Task Created Successfully")));
         Navigator.pop(context);
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            leading: Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const TasksScreen();
                    }));
                  },
                  icon: const Icon(Icons.arrow_back_ios_new_outlined)),
            ),
            centerTitle: true,
            title: const Text("Add Task"),
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
                  Container(
                    margin: EdgeInsets.symmetric(vertical: screenheight * 0.02),
                    width: screenwidth,
                    height: screenheight * 0.25,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.purpleAccent),
                        borderRadius: BorderRadius.circular(10)),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.image_outlined,
                          size: 100,
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text("Add Photo to your note"),
                        ),
                      ],
                    ),
                  ),
                  CustomButton(
                      width: screenwidth * 0.5,
                      height: screenheight * 0.05,
                      onPressed: () {
                        var task = TaskModel(
                            title: titleController.text,
                            description: descriptionController.text,
                            stDate: stDate!,
                            endDate: endDate!,
                            taskType: 'New');
                        cubit.addTask(task);
                        cubit.getTasks();
                        cubit.getTasksLength();
                      },
                      text: "Add Task")
                ],
              )),
            ),
          ),
        );
      },
    );
  }
}
