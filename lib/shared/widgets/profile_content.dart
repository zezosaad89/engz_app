import 'package:blobs/blobs.dart';
import 'package:engz_app/shared/theme/colors/light_color.dart';
import 'package:flutter/material.dart';

Widget profileContentStatus(context) => Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.3,
        decoration: BoxDecoration(
          color: LightColors.kDarkYellow,
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Row(
          children: [
            // Container(
            //   child: ClipPath(
            //     clipper: BlobClipper(
            //       id: '6-5-2450',
            //     ),
            //     child: Image.network(
            //       "https://image.freepik.com/free-photo/close-up-portrait-funny-bearded-male-looks-with-surprisement-touches-cheeks-opens-mouth-can-t-beleive-something-isolated-white-wall-people-emotions-concept_273609-15100.jpg",
            //     ),
            //   ),
            // ),
            SizedBox(
              width: 15,
            ),
            Container(
              width: 150,
              height: 150,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100.0),
                child: Image.network(
                  "https://image.freepik.com/free-photo/close-up-portrait-funny-bearded-male-looks-with-surprisement-touches-cheeks-opens-mouth-can-t-beleive-something-isolated-white-wall-people-emotions-concept_273609-15100.jpg",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              width: 15,
            ),
            Column(
              children: [
                Text(
                  'Abdelazez Saad',
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.0,
                    fontFamily: 'Caveat',
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
