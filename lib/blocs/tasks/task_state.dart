part of 'task_cubit.dart';

@immutable
abstract class TaskState {}

class TaskInitial extends TaskState {}
class AddTasksState extends TaskState {}

class GetTasksSuccessState extends TaskState {}
class GetTasksErrorState extends TaskState {}


