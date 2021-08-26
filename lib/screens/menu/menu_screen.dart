import 'package:engz_app/blocs/menu/menu_cubit.dart';
import 'package:engz_app/screens/auth/login_screen.dart';
import 'package:engz_app/shared/components/navigation.dart';
import 'package:engz_app/shared/theme/icons/broken_icons.dart';
import 'package:flutter/material.dart';
import 'package:engz_app/shared/theme/colors/light_color.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MenuCubit(),
      child: BlocConsumer<MenuCubit, MenuState>(
        listener: (context, state) {
          // TODO: implement listener
          if(state is  LogoutSuccessState){
            navigateEnd(context, LoginScreen());
          }
        },
        builder: (context, state) {
          var cubit = MenuCubit.get(context);
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
                      onTap: () {
                        cubit.signOut();
                      },
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
        },
      ),
    );
  }
}
