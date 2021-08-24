import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:engz_app/models/user_model.dart';
import 'package:engz_app/screens/layout_screen.dart';
import 'package:engz_app/shared/components/navigation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  static AuthCubit get(context) => BlocProvider.of(context);

  FirebaseAuth auth = FirebaseAuth.instance;

  void userLogin({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    await auth
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) {
      print(value.user!.uid);
      emit(SuccessUserLoginState(value.user!.uid));
    }).catchError((error) {
      emit(ErrorUserLoginState());
      print('Login Error is $error');
    });
  }


  void userRegister({
    required String email,
    required String password,
    required String name,
    required BuildContext context,
  }) async {
    await auth.createUserWithEmailAndPassword(email: email, password: password).then((value){
      emit(SuccessRegisterState());
      userCreate(email: email, name: name, uId: value.user!.uid);
    }).catchError((error){
      emit(ErrorRegisterState());
      print(error.toString());
    });
  }

  void userCreate({
    required String email,
    required String name,
    required String uId,
  }) {
    UserModel userModel = UserModel(
      email: email,
      name: name,
      uId: uId
    );
    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .set(userModel.toJson()).then((value){
        emit(SuccessCreateUserState(uId));
    }).catchError((error){
      emit(ErrorCreateUserState());
    });
  }


  // late File image;
  //
  // var picker = ImagePicker();
  //
  // Future getImage() async{
  //   final pickedFile = await picker.pickImage(source: ImageSource.gallery);
  //
  //   if(pickedFile != null){
  //     image = File(pickedFile.path);
  //     emit(PickImageSuccessState());
  //   } else{
  //     print('No image selected');
  //     emit(PickImageErrorState());
  //   }
  // }
}



