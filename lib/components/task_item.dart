import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tasks_app/blocs/task/task_cubit.dart';
import 'package:tasks_app/models/task_model.dart';
import 'package:tasks_app/screens/edit_task_screen.dart';

class TaskItem extends StatefulWidget {
  const TaskItem({super.key, required this.task});

  final TaskModel task;

  @override
  State<TaskItem> createState() => _TaskItemState();
}

class _TaskItemState extends State<TaskItem> {
  @override
  Widget build(BuildContext context) {
    var cubit = TaskCubit.get(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: GestureDetector(
        onTap: (){
          Navigator.push(
              context, MaterialPageRoute(builder: (context) {
            return EditTaskScreen(task: widget.task);
          }));
        },
        child: Container(
          height: 150,
          decoration: BoxDecoration(
              border: Border.all(
                  color: cubit.getBorderColor(widget.task.taskType), width: 3),
              color: Color(0xffd6fdfc),
              borderRadius: BorderRadius.circular(15)),
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.task.title,
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    IconButton(
                        onPressed: () {
                          widget.task.delete();
                          cubit.getTasks();
                          cubit.getTasksLength();
                        },
                        icon: Icon(Icons.delete_outline))
                  ],
                ),
                Row(
                  children: [
                    Text(
                      widget.task.description,
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: 150,
                      margin: EdgeInsets.only(top: 30),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.purple)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Icon(Icons.timer_outlined),
                            Text(DateFormat.yMd().format(widget.task.stDate))
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: 150,
                      margin: EdgeInsets.only(top: 30),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.purple)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Icon(Icons.timer_off_outlined),
                            Text(DateFormat.yMd().format(widget.task.endDate))
                          ],
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
