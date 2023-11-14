import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks_app/blocs/task/task_cubit.dart';
import 'package:tasks_app/components/task_list.dart';
import 'package:tasks_app/screens/new_task_screen.dart';

import 'dash_board_screen.dart';

class TasksScreen extends StatelessWidget {
  const TasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    var cubit = TaskCubit.get(context);
    cubit.getTasks();
    return BlocConsumer<TaskCubit, TaskState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
            appBar: AppBar(
              title: const Text("To Do App"),
              toolbarHeight: 40,
              backgroundColor: Colors.purpleAccent,
              actions: [
                IconButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return const DashBoardScreen();
                      }));
                    },
                    icon: const Icon(Icons.arrow_circle_right_outlined))
              ],
            ),
            floatingActionButton: FloatingActionButton.small(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const NewTaskScreen();
                }));
              },
              backgroundColor: Colors.purpleAccent,
              child: const Icon(Icons.add),
            ),
            drawer: Container(
              color: Colors.white,
              width: screenwidth * 0.7,
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(children: [
                  SizedBox(
                    width: 100,
                    height: 100,
                    child: CircleAvatar(
                      backgroundImage: AssetImage("assets/images/logo.png"),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Ali Raouf Ahmed",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Icon(
                          Icons.person_outline_rounded,
                          color: Colors.purpleAccent,
                        ),
                        Text(" Profile")
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Icon(
                          Icons.password_outlined,
                          color: Colors.purpleAccent,
                        ),
                        Text(" Change Password")
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Icon(
                          Icons.logout,
                          color: Colors.purpleAccent,
                        ),
                        Text(" Logout")
                      ],
                    ),
                  )
                ]),
              ),
            ),
            body: TaskList());
      },
    );
  }
}
