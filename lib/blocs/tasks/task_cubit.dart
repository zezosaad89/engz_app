import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:engz_app/models/task_model.dart';
import 'package:engz_app/shared/components/constance.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'task_state.dart';

class TaskCubit extends Cubit<TaskState> {
  TaskCubit() : super(TaskInitial());

  static TaskCubit get(context)=> BlocProvider.of(context);

  // CollectionReference tasks = FirebaseFirestore.instance.collection('tasks');
//
// Future<void>  addTasks(
//       {required String title,
//       required String desc,
//       required bool status,
//       required DateTime date,
//       required String startTime,
//       required String endTime}) {
//   return tasks.add({
//     'title' : title,
//     'desc' : desc,
//     'status' : status,
//     'date' : date,
//     'startTime' : startTime,
//     'endTime' : endTime,
//
//   }).then((value){
//     print('tasks added');
//     emit(AddTasksState());
//   }).catchError((error){
//     print(error.toString());
//   });
//
// }



late TaskModel taskModel;
List<TaskModel> allTasks = [];
List<TaskModel> myTasks = [];
void getTasks(){

  FirebaseFirestore.instance
      .collection('tasks')
      .get().then((value){
    allTasks = [];
    myTasks = [];
        value.docs.forEach((element) {
          allTasks.add(TaskModel.fromJson(element.data()));
          myTasks = [];
          allTasks.forEach((element) {
            if(element.uId == USER_UID){
              myTasks.add(element);
              emit(GetTasksSuccessState());
            }
          });
        });
  }).catchError((error){
    print(error.toString());
    emit(GetTasksErrorState());
  });
}


}
