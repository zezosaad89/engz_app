import 'package:bloc/bloc.dart';
import 'package:engz_app/screens/home/home_screen.dart';
import 'package:engz_app/screens/project/project_screen.dart';
import 'package:engz_app/screens/task_screen/task_screen.dart';
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
}
