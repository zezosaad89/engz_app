import 'package:auto_size_text/auto_size_text.dart';
import 'package:engz_app/blocs/tasks/task_cubit.dart';
import 'package:engz_app/models/task_model.dart';
import 'package:engz_app/screens/task_screen/add_task_screen.dart';
import 'package:engz_app/shared/components/navigation.dart';
import 'package:engz_app/shared/theme/colors/light_color.dart';
import 'package:engz_app/shared/theme/icons/broken_icons.dart';
import 'package:engz_app/shared/widgets/done_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:intl/intl.dart';

class TaskScreen extends StatelessWidget {
  const TaskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: LightColors.kLightYellow2,
        floatingActionButton: FloatingActionButton(
          backgroundColor: LightColors.kDarkYellow,
          child: Icon(
            IconBroken.Edit,
            color: LightColors.kDarkBlue,
          ),
          onPressed: () {
            navigateTo(context, CreateNewTaskPage());
          },
        ),
        body: BlocConsumer<TaskCubit, TaskState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            List<TaskModel> tasks = TaskCubit.get(context).myTasks;
            return _buildTask(tasks);
          },
        ));
  }
  Widget _buildTask(List<TaskModel> tasks) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: StaggeredGridView.countBuilder(
        crossAxisCount: 4,
        itemCount: tasks.length,
        staggeredTileBuilder: (int index) => StaggeredTile.fit(2),
        mainAxisSpacing: 10.0,
        crossAxisSpacing: 12.0,
        itemBuilder: (BuildContext context, int index) {

          return FlipCard(
            front: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: tasks[index].status!
                          ? Colors.blueGrey
                          : Color(tasks[index].color!),
                      borderRadius: BorderRadius.circular(20.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 5,
                          spreadRadius: 3,
                          offset: Offset(0.0, 0.3),
                        )
                      ]),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      children: [
                        Text(
                          tasks[index].title!,
                          style: TextStyle(
                            color: LightColors.kDarkBlue,
                            fontSize: 25.0,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Caveat',
                          ),
                        ),
                        Divider(),
                        Text(
                          tasks[index].description!,
                          style: TextStyle(
                            color: LightColors.kDarkBlue,
                            fontSize: 18.0,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Caveat',
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "From ",
                                  style: TextStyle(
                                    color: LightColors.kDarkBlue,
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'Caveat',
                                  ),
                                ),
                                Text(
                                  tasks[index].startTime!,
                                  style: TextStyle(
                                    color: LightColors.kDarkBlue,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'Caveat',
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "To ",
                                  style: TextStyle(
                                    color: LightColors.kDarkBlue,
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'Caveat',
                                  ),
                                ),
                                Text(
                                  tasks[index].endTime!,
                                  style: TextStyle(
                                    color: LightColors.kDarkBlue,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'Caveat',
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Day : ${tasks[index].date}",
                          style: TextStyle(
                            color: LightColors.kDarkBlue,
                            fontSize: 18.0,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Caveat',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // if (tasks[index].status == false)
                  // Positioned(
                  //     top: 0,
                  //     right: 0.0,
                  //     child: Container(
                  //       height: 50,
                  //       width: 15,
                  //       decoration: BoxDecoration(
                  //         color: tasks[index].category == "notes"
                  //             ? LightColors.kRed
                  //             : tasks[index].category == "today"
                  //             ? LightColors.kBlue
                  //             : LightColors.kGreen,
                  //         borderRadius: BorderRadius.circular(10.0),
                  //       ),
                  //     )),
              ],
            ),
            back: Container(
              decoration: BoxDecoration(
                  color: Color(tasks[index].color!),
                  borderRadius: BorderRadius.circular(20.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 5,
                      spreadRadius: 3,
                      offset: Offset(0.1, 0.2),
                    )
                  ]),
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.black54,
                        borderRadius: BorderRadius.circular(20.0)),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        children: [
                          Text(
                            tasks[index].title!,
                            style: TextStyle(
                              color: LightColors.kDarkBlue,
                              fontSize: 25.0,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Caveat',
                            ),
                          ),
                          Divider(),
                          Text(
                            tasks[index].description!,
                            style: TextStyle(
                              color: LightColors.kDarkBlue,
                              fontSize: 18.0,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Caveat',
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    "From ",
                                    style: TextStyle(
                                      color: LightColors.kDarkBlue,
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: 'Caveat',
                                    ),
                                  ),
                                  Text(
                                    tasks[index].startTime!,
                                    style: TextStyle(
                                      color: LightColors.kDarkBlue,
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: 'Caveat',
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    "To ",
                                    style: TextStyle(
                                      color: LightColors.kDarkBlue,
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: 'Caveat',
                                    ),
                                  ),
                                  Text(
                                    tasks[index].endTime!,
                                    style: TextStyle(
                                      color: LightColors.kDarkBlue,
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: 'Caveat',
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "Day : ${tasks[index].date}",
                            style: TextStyle(
                              color: LightColors.kDarkBlue,
                              fontSize: 18.0,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Caveat',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 10,
                    left: 10,
                    child: buildDoneButton(tasks[index]),
                  ),
                  Positioned(
                    bottom: 40,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 5,
                        ),
                        GestureDetector(
                          onTap: () {
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) =>
                            //             UpdatTaskScreen(task: tasks[index])));
                          },
                          child: Container(
                            height: 40,
                            width: MediaQuery.of(context).size.width * 0.2,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: LightColors.kGreen,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  IconBroken.Edit,
                                  color: Colors.white,
                                ),
                                AutoSizeText(
                                  "Edit",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        GestureDetector(
                          onTap: () {
                            // AwesomeDialog(
                            //   dismissOnBackKeyPress: true,
                            //   context: context,
                            //   dialogType: DialogType.WARNING,
                            //   animType: AnimType.BOTTOMSLIDE,
                            //   title: 'Delete Task',
                            //   desc: 'Task ${tasks[index].title} Deleted',
                            //   btnCancelOnPress: () {
                            //     // Navigator.of(context).pop();
                            //   },
                            //   btnOkOnPress: () {
                            //     deleteTasks(tasks[index]);
                            //   },
                            // )..show();
                          },
                          child: Container(
                            height: 40,
                            width: MediaQuery.of(context).size.width * 0.21,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: LightColors.kRed,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  IconBroken.Delete,
                                  color: Colors.white,
                                ),
                                AutoSizeText(
                                  "Delete",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }

}
