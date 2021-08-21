import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class ActiveProjectsCard extends StatelessWidget {
  final Color cardColor;
  final double loadingPercent;
  final String title;
  final String subtitle;
  //final List tasks;

  ActiveProjectsCard({
    required this.cardColor,
    required this.loadingPercent,
    required this.title,
    required this.subtitle,
    //required this.tasks,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 4.0),
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(40.0),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child:
                    // tasks.length == 0
                    //     ? Padding(
                    //         padding: const EdgeInsets.only(top: 40.0),
                    //         child: Text(
                    //           "No Tasks",
                    //           style: TextStyle(
                    //               fontWeight: FontWeight.w700, color: Colors.white),
                    //         ),
                    //       )
                    //     :
                    CircularPercentIndicator(
                  animation: true,
                  radius: 75.0,
                  percent: loadingPercent,
                  lineWidth: 5.0,
                  circularStrokeCap: CircularStrokeCap.round,
                  backgroundColor: Colors.white10,
                  progressColor: Colors.white,
                  center: Text(
                    '${(loadingPercent * 100).round()}%',
                    style: TextStyle(
                        fontWeight: FontWeight.w700, color: Colors.white),
                  ),
                ),
              ),
            ),
            Center(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Center(
              child: Text(
                subtitle,
                style: TextStyle(
                  fontSize: 12.0,
                  color: Colors.white54,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
