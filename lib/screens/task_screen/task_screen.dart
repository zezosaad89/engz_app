import 'package:engz_app/screens/task_screen/add_task_screen.dart';
import 'package:engz_app/shared/components/navigation.dart';
import 'package:flutter/material.dart';

class TaskScreen extends StatelessWidget {
  const TaskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          navigateTo(context, CreateNewTaskPage());
        },
      ),
      body: Center(
        child: Text('Task Screen'),
      ),
    );
  }
}
