import 'package:engz_app/blocs/home/home_cubit.dart';
import 'package:engz_app/blocs/tasks/task_cubit.dart';
import 'package:engz_app/screens/task_screen/task_screen.dart';
import 'package:engz_app/shared/components/navigation.dart';
import 'package:engz_app/shared/widgets/back_button.dart';
import 'package:engz_app/shared/widgets/color_picker.dart';
import 'package:engz_app/shared/widgets/my_text_form_filed.dart';
import 'package:engz_app/shared/widgets/top_container.dart';
import 'package:flutter/material.dart';
import 'package:engz_app/shared/theme/colors/light_color.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class CreateNewTaskPage extends StatefulWidget {
  @override
  _CreateNewTaskPageState createState() => _CreateNewTaskPageState();
}

class _CreateNewTaskPageState extends State<CreateNewTaskPage> {
  final TextEditingController _titleController = TextEditingController();

  final TextEditingController _desController = TextEditingController();

  final TextEditingController _dateController = TextEditingController();

  final TextEditingController _startTimeController = TextEditingController();

  final TextEditingController _endTimeController = TextEditingController();
  final RoundedLoadingButtonController _btnController = RoundedLoadingButtonController();
  late DateTime date;

  late TimeOfDay startTime;
  late TimeOfDay endTime;
  String categoty = "notes";
  int color = 0xFFFADEAD;
  List<bool> actives = [
    false,
    true,
    false,
  ];
  // Future<void> addTask(String name, String desc, bool status, String startTime,
  //     String endTime, DateTime date, String category) async {
  //   final task = Task()
  //     ..title = name
  //     ..description = desc
  //     ..startTime = startTime
  //     ..endTime = endTime
  //     ..date = date
  //     ..category = category
  //     ..color = color
  //     ..status = status;

  //   final box = Boxes.getTasks();
  //   box.add(task);
  // }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    var downwardIcon = Icon(
      Icons.keyboard_arrow_down,
      color: Colors.black54,
    );
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        // TODO: implement listener
        if(state is AddTasksSuccessState){
          _btnController.success();
          //navigateTo(context, TaskScreen());
        }
      },
      builder: (context, state) {
        var cubt = HomeCubit.get(context);
        var taskCubit = TaskCubit.get(context);
        return Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                TopContainer(
                  padding: EdgeInsets.fromLTRB(20, 20, 20, 40),
                  width: width,
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 20.0,
                      ),
                      MyBackButton(),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Create new task',
                            style: TextStyle(
                                fontSize: 30.0, fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Container(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          MyTextField(
                            controller: _titleController,
                            label: 'Title',
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              Expanded(
                                child: MyTextField(
                                  controller: _dateController,
                                  label: 'Date',
                                  icon: downwardIcon,
                                  readonly: true,
                                  ontap: () {
                                    showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime.now(),
                                      lastDate: DateTime(2222),
                                    ).then((value) {
                                      _dateController.text = DateFormat.yMMMd()
                                          .format(value!)
                                          .toString();
                                      setState(() {
                                        date = value;
                                      });
                                    });
                                  },
                                ),
                              ),
                            ],
                          )
                        ],
                      ))
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Expanded(
                            child: MyTextField(
                              controller: _startTimeController,
                              label: 'Start Time',
                              icon: downwardIcon,
                              readonly: true,
                              ontap: () {
                                showTimePicker(
                                  context: context,
                                  initialTime: TimeOfDay.now(),
                                ).then(
                                  (value) {
                                    _startTimeController.text =
                                        value!.format(context);
                                    setState(() {
                                      startTime = value;
                                    });
                                  },
                                );
                              },
                            ),
                          ),
                          SizedBox(width: 40),
                          Expanded(
                            child: MyTextField(
                              controller: _endTimeController,
                              label: 'End Time',
                              icon: downwardIcon,
                              readonly: true,
                              ontap: () {
                                showTimePicker(
                                  context: context,
                                  initialTime: TimeOfDay.now(),
                                ).then(
                                  (value) {
                                    setState(() {
                                      endTime = value!;
                                    });

                                    _endTimeController.text =
                                        value!.format(context);
                                  },
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Container(
                        height: 30,
                        child: MyColorPicker(
                          onSelectColor: (value) {
                            setState(() {
                              color = value;
                            });
                          },
                          availableColors: [
                            0xFFFADEAD,
                            0xFFF7E5D5,
                            0xFFF8DBD9,
                            0xFFFAA2A4,
                            0xFFEDEEEF,
                            0xFF9DECFC,
                            0xFFF8F580,
                            0xFFC7A1D3,
                            0xFFFFD9E3,
                            0xFFffcdd2,
                          ],
                          initialColor: Color(color),
                          circleItem: true,
                        ),
                      ),
                      MyTextField(
                        controller: _desController,
                        label: 'Description',
                        minLines: 3,
                        maxLines: 3,
                        keyboardType: TextInputType.multiline,
                      ),
                      SizedBox(height: 20),
                      Container(
                        alignment: Alignment.topLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Category',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.black54,
                              ),
                            ),
                            // Wrap(
                            //   crossAxisAlignment: WrapCrossAlignment.start,
                            //   //direction: Axis.vertical,
                            //   alignment: WrapAlignment.start,
                            //   verticalDirection: VerticalDirection.down,
                            //   runSpacing: 0,
                            //   //textDirection: TextDirection.rtl,
                            //   spacing: 10.0,
                            //   children: <Widget>[
                            //     GestureDetector(
                            //       onTap: () {
                            //         setState(() {
                            //           actives[0] = true;
                            //           actives[1] = false;
                            //           actives[2] = false;
                            //           categoty = "workout";
                            //         });
                            //       },
                            // child: category(
                            //     isActive: actives[0], lable: "Work Out")),
                            // GestureDetector(
                            //     onTap: () {
                            //       setState(() {
                            //         actives[1] = true;
                            //         actives[0] = false;
                            //         actives[2] = false;
                            //         categoty = "notes";
                            //       });
                            //     },
                            //     child: category(
                            //       isActive: actives[1],
                            //       lable: "Notes",
                            //     )),
                            // GestureDetector(
                            //     onTap: () {
                            //       setState(() {
                            //         actives[2] = true;
                            //         actives[0] = false;
                            //         actives[1] = false;
                            //         categoty = "today";
                            //       });
                            //       _dateController.text = DateFormat.yMMMd()
                            //           .format(DateTime.now())
                            //           .toString();
                            //     },
                            //     child: category(
                            //       isActive: actives[2],
                            //       lable: "ToDay",
                            //     )),
                            //     ),
                            //   ],
                            // ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                // GestureDetector(
                //   onTap: () {
                //     // AwesomeDialog(
                //     //   dismissOnBackKeyPress: true,
                //     //   context: context,
                //     //   dialogType: DialogType.SUCCES,
                //     //   animType: AnimType.BOTTOMSLIDE,
                //     //   title: 'Add Task',
                //     //   desc: 'Task ${_titleController.text} Added',
                //     //   btnCancelOnPress: () {
                //     //     // Navigator.of(context).pop();
                //     //   },
                //     //   btnOkOnPress: () {
                //     //     addTask(
                //     //             _titleController.text,
                //     //             _desController.text,
                //     //             false,
                //     //             _startTimeController.text,
                //     //             _endTimeController.text,
                //     //             date,
                //     //             categoty)
                //     //         .then((value) {
                //     //       navigateEnd(context, TaskScreen());
                //     //     }).catchError((error) {
                //     //       print(error.toString());
                //     //     });
                //     //   },
                //     // )..show();
                //     // cubt.addTasks(
                //     //   title: _titleController.text,
                //     //   desc: _desController.text,
                //     //   status: false,
                //     //   date: date,
                //     //   startTime: _startTimeController.text,
                //     //   endTime: _endTimeController.text,
                //     // );
                //     cubt.createTask(
                //       title: _titleController.text,
                //         description: _desController.text,
                //         date: date,
                //         status: false,
                //         level: 'low',
                //         startTime: _startTimeController.text,
                //         endTime: _endTimeController.text,
                //     );
                //
                //
                //
                //     print(_titleController.text);
                //
                //   },
                //   child: Container(
                //     height: 80,
                //     width: width,
                //     child: Row(
                //       crossAxisAlignment: CrossAxisAlignment.stretch,
                //       children: <Widget>[
                //         Container(
                //           child: Text(
                //             'Create Task',
                //             style: TextStyle(
                //                 color: Colors.white,
                //                 fontWeight: FontWeight.w700,
                //                 fontSize: 18),
                //           ),
                //           alignment: Alignment.center,
                //           margin: EdgeInsets.fromLTRB(20, 10, 20, 20),
                //           width: width - 40,
                //           decoration: BoxDecoration(
                //             color: LightColors.kBlue,
                //             borderRadius: BorderRadius.circular(20),
                //           ),
                //         ),
                //       ],
                //     ),
                //   ),
                // ),
                RoundedLoadingButton(
                  controller: _btnController,
                  child: Text(
                    'Create Task',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 18),
                  ),
                  onPressed: () {
                    cubt.createTask(
                      title: _titleController.text,
                      description: _desController.text,
                      date: DateFormat.yMMMd().format(date).toString(),
                      status: false,
                      level: 'low',
                      startTime: _startTimeController.text,
                      endTime: _endTimeController.text,
                      color: color,
                    ).then((value){
                      Navigator.pop(context);
                      taskCubit.getTasks();
                    });
                  }

                )
              ],
            ),
          ),
        );
      },
    );
  }
}
