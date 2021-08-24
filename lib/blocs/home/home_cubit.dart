import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:engz_app/models/task_model.dart';
import 'package:engz_app/models/user_model.dart';
import 'package:engz_app/screens/home/home_screen.dart';
import 'package:engz_app/screens/project/project_screen.dart';
import 'package:engz_app/screens/task_screen/task_screen.dart';
import 'package:engz_app/shared/components/constance.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  static HomeCubit get(context) => BlocProvider.of(context);

  int index = 0;

  List mainScreen = [
    HomeScreen(),
    TaskScreen(),
    ProjectScreen(),
  ];

  List<String> appBarTitle = [
    'ENGZ',
    'Tasks',
    'Projects',
  ];

  void changeIndex(index) {
    this.index = index;
    emit(ChangeNavBarIndexState());
  }

   late UserModel userModel;

  void getUserData() {
  emit(GetUserDataLoadingState());
    FirebaseFirestore.instance
        .collection('users')
        .doc(USER_UID)
        .get()
        .then((value){
          print(value.data());
          emit(GetUserDataSuccessState());
          userModel = UserModel.fromJson(value.data()!);
          print(userModel.uId);
    }).catchError((error){
      emit(GetUserDataErrorState());
    });

  }

  Future<void> createTask({
    required String title,
     String? uId,
    required String description,
    required String date,
    required bool status,
    required String level,
    required String startTime,
    required String endTime,
    required int color,
  }) async {
    emit(AddTasksLoadingState());

    TaskModel taskModel = TaskModel(
      date: date,
      title: title,
      description: description,
      endTime: endTime,
      level: level,
      startTime: startTime,
      status: status,
      uId: userModel.uId,
      color: color,
    );

    FirebaseFirestore.instance
    .collection('tasks')
    .doc()
    .set(taskModel.toMap())
    .then((value){
      emit(AddTasksSuccessState());
    }).catchError((error){
      emit(AddTasksErrorState());
      print(error.toString());
    });

  }
}
