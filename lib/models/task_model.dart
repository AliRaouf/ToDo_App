import 'package:hive/hive.dart';
part 'task_model.g.dart';
@HiveType(typeId: 0)
class TaskModel extends HiveObject{
  @HiveField(0)
   String title;
  @HiveField(1)
   String description;
  @HiveField(2)
   DateTime stDate;
  @HiveField(3)
   DateTime endDate;
  @HiveField(4)
   String taskType;

  TaskModel({required this.taskType,required this.title,required this.description,required this.stDate,required this.endDate});
}