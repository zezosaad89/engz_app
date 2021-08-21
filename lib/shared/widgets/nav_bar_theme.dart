import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Color inactivColor = Colors.white;

Widget myBottomNavBar({
  required void Function(int index) onItemSelected,
  required index,
}) {
  return BottomNavyBar(
    backgroundColor: Colors.black,
    containerHeight: 70,
    itemCornerRadius: 15,
    items: <BottomNavyBarItem>[
      BottomNavyBarItem(
        icon: Icon(
          CupertinoIcons.home,
          size: 25,
        ),
        inactiveColor: inactivColor,
        title: Text('Home'),
        textAlign: TextAlign.center,
      ),
      BottomNavyBarItem(
        icon: Icon(
          Icons.paste_rounded,
          size: 25,
        ),
        inactiveColor: inactivColor,
        title: Text('Tasks'),
        textAlign: TextAlign.center,
      ),
      BottomNavyBarItem(
        icon: Icon(
          CupertinoIcons.circle_grid_hex,
          size: 25,
        ),
        title: Text('Projects'),
        inactiveColor: inactivColor,
        textAlign: TextAlign.center,
      ),
    ],
    onItemSelected: onItemSelected,
    selectedIndex: index,
  );
}
