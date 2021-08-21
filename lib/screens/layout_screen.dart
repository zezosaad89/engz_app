import 'package:engz_app/blocs/home/home_cubit.dart';
import 'package:engz_app/screens/menu/menu_screen.dart';
import 'package:engz_app/shared/theme/colors/light_color.dart';
import 'package:engz_app/shared/theme/icons/broken_icons.dart';
import 'package:engz_app/shared/widgets/nav_bar_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

class EngzeLayOut extends StatelessWidget {
  EngzeLayOut({Key? key}) : super(key: key);

  final zoomDrawerController = ZoomDrawerController();

  @override
  Widget build(BuildContext context) {
    var cubt = HomeCubit.get(context);
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: LightColors.kLightYellow2,
            centerTitle: true,
            title: Text(
              cubt.appBarTitle[cubt.index],
              style: TextStyle(
                color: LightColors.kDarkBlue,
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.4,
                fontFamily: 'BOXIGEN',
              ),
            ),
            iconTheme: IconThemeData(
              color: LightColors.kDarkBlue,
            ),
            leading: InkWell(
              onTap: () {
                zoomDrawerController.toggle!();
              },
              child: Icon(Icons.menu),
            ),
            elevation: 0.0,
          ),
          bottomNavigationBar: myBottomNavBar(
              onItemSelected: (index) {
                cubt.changeIndex(index);
              },
              index: cubt.index),
          body: ZoomDrawer(
            controller: zoomDrawerController,
            style: DrawerStyle.Style1,
            menuScreen: MenuScreen(),
            mainScreen: cubt.mainScreen[cubt.index],
            borderRadius: 24.0,
            showShadow: true,
            backgroundColor: Colors.grey[300]!,
            angle: -10,
            slideWidth: MediaQuery.of(context).size.width * 0.65,
            openCurve: Curves.fastOutSlowIn,
            closeCurve: Curves.bounceOut,
          ),
        );
      },
    );
  }
}
