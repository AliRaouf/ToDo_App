import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:tasks_app/blocs/bloc_observer.dart';
import 'models/task_model.dart';
import 'src/app_root.dart';
void main() async{
  Bloc.observer=SimpleBlocObserver();
  await Hive.initFlutter();
  Hive.registerAdapter(TaskModelAdapter());
  await Hive.openBox<TaskModel>("task_box");
  runApp(const AppRoot());
}