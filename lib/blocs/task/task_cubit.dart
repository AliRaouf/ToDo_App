import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:flutter/material.dart';
import '../../models/task_model.dart';

part 'task_state.dart';

class TaskCubit extends Cubit<TaskState> {
  TaskCubit() : super(TaskInitial());

  static TaskCubit get(context) => BlocProvider.of(context);
  bool isLoading = false;
  List<TaskModel>? tasks;
  int? tasksAmount;
  int? newTasks;
  int? inProgressTasks;
  int? completedTasks;
  int? outDatedTasks;
  addTask(TaskModel task) async {
    emit(CreateTaskLoading());
    isLoading = true;
    try {
      var taskBox = Hive.box<TaskModel>("task_box");
      await taskBox.add(task);
      isLoading = false;
      emit(CreateTaskSuccess());
    } catch (e) {
      isLoading = false;
      emit(CreateTaskError(e.toString()));
      print(e);
    }
  }

  getTasks() async {
    emit(GetTaskLoading());
    try {
      var taskBox = Hive.box<TaskModel>("task_box");
      tasks = taskBox.values.toList();
      emit(GetTaskSuccess());
    } catch (e) {
      emit(GetTaskError(e.toString()));
      print(e);
    }
  }
getTasksLength() {
    var taskBox = Hive.box<TaskModel>("task_box");
    tasksAmount=taskBox.length;
    newTasks=taskBox.values.where((task) =>task.taskType=="New").length;
    inProgressTasks = taskBox.values.where((task) => task.taskType == "In Progress").length;
    completedTasks = taskBox.values.where((task) => task.taskType == "Completed").length;
    outDatedTasks = taskBox.values.where((task) => task.taskType == "OutDated").length;
    print("new:$newTasks + inprogress:$inProgressTasks + completed:$completedTasks + outDated:$outDatedTasks");
  }
  Color getBorderColor(String taskType) {
    switch (taskType) {
      case "New":
        return Colors.purple;
      case "In Progress":
        return Colors.blue;
      case "Completed":
        return Colors.green;
      case "OutDated":
        return Colors.black12;
      default:
        return Colors.red;
    }
  }
}
