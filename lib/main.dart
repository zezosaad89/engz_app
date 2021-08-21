import 'package:bloc/bloc.dart';
import 'package:engz_app/blocs/home/home_cubit.dart';
import 'package:engz_app/screens/layout_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'my_observer.dart';

void main() async {
  Bloc.observer = MyBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(

      providers: [
        BlocProvider(create: (BuildContext context)=> HomeCubit())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Engz',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: EngzeLayOut()
      ),
    );
  }
}
