


import 'package:engz_app/models/task_model.dart';
import 'package:engz_app/shared/theme/icons/broken_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget buildDoneButton(TaskModel task)=> GestureDetector(
  onTap: (){
    // if(!task.status!){
    //   task.status = true;
    //   task.save();
    // } else{
    //   print("this Task is Done");
    // }
  },
  child:   Container(
    width: 35,
    height: 35,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(30),
      color: task.status! ?  Colors.green : Colors.white,
    ),

    child: Center(
      child: task.status! ? Icon(Icons.check, color: Colors.white,): Container(),
    ) ,
  ),
);