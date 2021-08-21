import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void navigateTo(BuildContext context, screen) => Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => screen),
    );

void navigateEnd(BuildContext context, screen) => Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => screen),
    );
