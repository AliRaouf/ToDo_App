part of 'task_cubit.dart';

@immutable
abstract class TaskState {}

class TaskInitial extends TaskState {}
class CreateTaskSuccess extends TaskState {}
class CreateTaskLoading extends TaskState {}
class CreateTaskError extends TaskState {
  final String errorMessage;

  CreateTaskError(this.errorMessage);

}
class GetTaskSuccess extends TaskState {
  // final List<TaskModel> tasks;
  //
  // GetTaskSuccess(this.tasks);
}
class GetTaskLoading extends TaskState {}
class GetTaskError extends TaskState {
  final String errorMessage;

  GetTaskError(this.errorMessage);

}



