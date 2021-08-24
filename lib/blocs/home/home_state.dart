part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}
class ChangeNavBarIndexState extends HomeState {}


class GetTasksLoadingState extends HomeState {}
class GetTasksSuccessState extends HomeState {}
class GetTasksErrorState extends HomeState {}



class AddTasksLoadingState extends HomeState {}
class AddTasksSuccessState extends HomeState {}
class AddTasksErrorState extends HomeState {}


class GetUserDataLoadingState extends HomeState {}
class GetUserDataSuccessState extends HomeState {}
class GetUserDataErrorState extends HomeState {}
