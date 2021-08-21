import 'package:engz_app/shared/theme/colors/light_color.dart';
import 'package:engz_app/shared/widgets/active_project_card.dart';
import 'package:engz_app/shared/widgets/profile_content.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    profileContentStatus(context),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, top: 20),
                      child: Text(
                        'My Task',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: LightColors.kDarkBlue,
                          fontSize: 22.0,
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    buildMainTasks(
                        LightColors.kRed, Icons.alarm, 'To Do', '1 projects'),
                    buildMainTasks(LightColors.kDarkYellow, Icons.blur_circular,
                        'In Progress', '2 tasks now'),
                    buildMainTasks(LightColors.kBlue,
                        Icons.check_circle_outline, 'Done', '3 tasks now.'),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 20.0, top: 15.0, bottom: 15.0),
                      child: Text(
                        'Active Projects',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22.0,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          SliverGrid(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: ActiveProjectsCard(
                        cardColor: LightColors.kRed,
                        loadingPercent: 0.36,
                        title: 'named',
                        subtitle: 'Tasks'),
                  );
                },
                childCount: 3,
              ),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              )),
        ],
      ),
    );
  }

  Widget buildMainTasks(
    Color color,
    IconData icon,
    String name,
    String content,
  ) =>
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
        child: Container(
          width: double.infinity,
          child: Row(
            children: [
              Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(50.0),
                ),
                child: Center(
                  child: Icon(
                    icon,
                    color: Colors.white,
                    size: 20.0,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 16.0,
                      ),
                    ),
                    Text(
                      content,
                      style: TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.w400,
                        fontSize: 14.0,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
}
