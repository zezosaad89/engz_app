import 'package:bloc/bloc.dart';
import 'package:engz_app/blocs/home/home_cubit.dart';
import 'package:engz_app/blocs/tasks/task_cubit.dart';
import 'package:engz_app/screens/auth/login_screen.dart';
import 'package:engz_app/blocs/auth/auth_cubit.dart';
import 'package:engz_app/screens/layout_screen.dart';
import 'package:engz_app/shared/components/constance.dart';
import 'package:engz_app/shared/network/local/cashe_helper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'my_observer.dart';

void main() async {
  Bloc.observer = MyBlocObserver();

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await CacheHelper.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(

      providers: [
        BlocProvider(create: (BuildContext context)=> HomeCubit()..getUserData()),
        BlocProvider(create: (BuildContext context)=> TaskCubit()),
        BlocProvider(create: (BuildContext context)=> AuthCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Engz',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: USER_UID != null ? EngzeLayOut() : LoginScreen(),
      ),
    );
  }
}
