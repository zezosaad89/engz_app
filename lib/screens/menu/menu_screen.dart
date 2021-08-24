import 'package:engz_app/shared/theme/icons/broken_icons.dart';
import 'package:flutter/material.dart';
import 'package:engz_app/shared/theme/colors/light_color.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LightColors.kLightYellow2,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: InkWell(
                onTap: () {},
                child: Row(
                  children: [
                    Icon(
                      IconBroken.Setting,
                      size: 35,
                      color: LightColors.kDarkBlue,
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Text(
                      "Settings",
                      style: TextStyle(
                        color: LightColors.kDarkBlue,
                        fontWeight: FontWeight.w600,
                        fontSize: 20.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Divider(),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: InkWell(
                onTap: () {},
                child: Row(
                  children: [
                    Icon(
                      IconBroken.Graph,
                      size: 35,
                      color: LightColors.kDarkBlue,
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Text(
                      "Dashboard",
                      style: TextStyle(
                        color: LightColors.kDarkBlue,
                        fontWeight: FontWeight.w600,
                        fontSize: 20.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Divider(),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: InkWell(
                onTap: () {},
                child: Row(
                  children: [
                    Icon(
                      IconBroken.Star,
                      size: 35,
                      color: LightColors.kDarkBlue,
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Text(
                      "Rating",
                      style: TextStyle(
                        color: LightColors.kDarkBlue,
                        fontWeight: FontWeight.w600,
                        fontSize: 20.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Divider(),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: InkWell(
                onTap: () {},
                child: Row(
                  children: [
                    Icon(
                      IconBroken.Logout,
                      size: 35,
                      color: LightColors.kDarkBlue,
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Text(
                      "Logout",
                      style: TextStyle(
                        color: LightColors.kDarkBlue,
                        fontWeight: FontWeight.w600,
                        fontSize: 20.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
