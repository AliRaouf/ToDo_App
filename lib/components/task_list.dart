import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks_app/blocs/task/task_cubit.dart';

import 'task_item.dart';

class TaskList extends StatefulWidget {
  const TaskList({super.key});

  @override
  State<TaskList> createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  @override
  Widget build(BuildContext context) {
    var cubit = TaskCubit.get(context);
    return BlocBuilder<TaskCubit, TaskState>(builder: (context, state) {
      return Column(
        children: [
          Expanded(
              child: ListView.builder(
                  itemCount: cubit.tasks?.length ?? 10,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 5),
                      child: TaskItem(task: cubit.tasks![index]),
                    );
                  }))
        ],
      );
    });
  }
}
