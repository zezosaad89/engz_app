import 'package:bloc/bloc.dart';
import 'package:engz_app/shared/network/local/cashe_helper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'menu_state.dart';

class MenuCubit extends Cubit<MenuState> {
  MenuCubit() : super(MenuInitial());

  static MenuCubit get(context) => BlocProvider.of(context);


  void signOut()
  {
    FirebaseAuth.instance.signOut().then((value){
      CacheHelper.remove(key: 'uId');
      emit(LogoutSuccessState());
    }).catchError((error){
      emit(LogoutErrorState());
      print(error.toString());
    });

  }
}
