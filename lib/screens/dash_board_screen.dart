import 'package:flutter/material.dart';
import 'package:tasks_app/blocs/task/task_cubit.dart';
import 'package:tasks_app/screens/tasks_screen.dart';

import '../components/custom_button.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({super.key});

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  @override
  Widget build(BuildContext context) {
    double screenheight = MediaQuery.of(context).size.height;
    double screenwidth = MediaQuery.of(context).size.width;
    var cubit = TaskCubit.get(context);
    return Scaffold(
      appBar: AppBar(automaticallyImplyLeading: false,
          title: const Text("DashBoard Tasks"),
          backgroundColor: Colors.purpleAccent,
          centerTitle: true),
      body: Container(
        margin: const EdgeInsets.only(top: 50, left: 25, right: 25),
        child: Column(
          children: [
            Center(
              child: Stack(children: [
                SizedBox(
                  width: 300,
                  height: 300,
                  child: CircularProgressIndicator(
                    color: Colors.purple,
                    backgroundColor: Colors.grey[300],
                    strokeAlign: BorderSide.strokeAlignOutside,
                    value: cubit.tasksAmount != 0 && cubit.newTasks !=0
                        ? cubit.newTasks! / cubit.tasksAmount!
                        : 0,
                    strokeWidth: 10,
                  ),
                ),
                Container(
                  width: 270,
                  height: 270,
                  margin: const EdgeInsets.only(left: 15, top: 15),
                  child: CircularProgressIndicator(
                    color: Colors.blue,
                    backgroundColor: Colors.grey[300],
                    strokeAlign: BorderSide.strokeAlignOutside,
                    value: cubit.tasksAmount != 0 && cubit.inProgressTasks !=0
                        ? cubit.inProgressTasks! / cubit.tasksAmount!
                        : 0,
                    strokeWidth: 10,
                  ),
                ),
                Container(
                  width: 240,
                  height: 240,
                  margin: const EdgeInsets.only(left: 30, top: 30),
                  child: CircularProgressIndicator(
                    color: Colors.green[700],
                    backgroundColor: Colors.grey[300],
                    strokeAlign: BorderSide.strokeAlignOutside,
                    value: cubit.tasksAmount != 0 && cubit.completedTasks !=0
                        ? cubit.completedTasks! / cubit.tasksAmount!
                        : 0,
                    strokeWidth: 10,
                  ),
                ),
                Container(
                  width: 210,
                  height: 210,
                  margin: const EdgeInsets.only(left: 45, top: 45),
                  child: CircularProgressIndicator(
                    color: Colors.grey[800],
                    backgroundColor: Colors.grey[300],
                    strokeAlign: BorderSide.strokeAlignOutside,
                    value: cubit.tasksAmount != 0 && cubit.outDatedTasks !=0
                        ? cubit.outDatedTasks! / cubit.tasksAmount!
                        : 0,
                    strokeWidth: 10,
                  ),
                ),
                Container(
                    margin: const EdgeInsets.only(top: 135, left: 100),
                    child: Text(
                      "${cubit.tasksAmount!} Tasks",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ))
              ]),
            ),
            Row(children: [
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                height: 20,
                width: 20,
                decoration: BoxDecoration(
                    color: Colors.purple,
                    borderRadius: BorderRadius.circular(2)),
              ),
              const Text(
                "  New Tasks",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              )
            ]),
            Row(
              children: [
                Container(
                  height: 20,
                  width: 20,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(2)),
                ),
                const Text(
                  "  In Progress Tasks",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                )
              ],
            ),
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  height: 20,
                  width: 20,
                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(2)),
                ),
                const Text(
                  "  Completed Tasks",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                )
              ],
            ),
            Row(
              children: [
                Container(
                  height: 20,
                  width: 20,
                  decoration: BoxDecoration(
                      color: Colors.grey[800],
                      borderRadius: BorderRadius.circular(2)),
                ),
                const Text(
                  "  OutDated Tasks",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: CustomButton(width: screenwidth*0.5, height: screenheight*0.06, onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const TasksScreen();
                }
                )
                );
              },text: "Back To Tasks",),
            )
          ],
        ),
      ),
    );
  }
}
