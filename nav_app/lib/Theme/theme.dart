import 'dart:ui';

import 'package:flutter/material.dart';

class ThemeApp {
  static String NameApp = 'DeliMeals';
  static ThemeData data = ThemeData(
    primarySwatch: Colors.pink,
    accentColor: Color.fromARGB(255, 236, 179, 9),
    canvasColor: const Color.fromRGBO(255, 254, 229, 1),
    fontFamily: 'Raleway',
    textTheme: const TextTheme(
      bodyText1: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
      bodyText2: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
      headline1: TextStyle(
          fontSize: 24,
          fontFamily: 'RobotoCondensed',
          fontWeight: FontWeight.bold),
      headline2: TextStyle(
          fontSize: 22,
          fontFamily: 'RobotoCondensed',
          fontWeight: FontWeight.bold),
      headline3: TextStyle(
          fontSize: 20,
          fontFamily: 'RobotoCondensed',
          fontWeight: FontWeight.bold),
      headline4: TextStyle(
          fontSize: 19,
          fontFamily: 'RobotoCondensed',
          fontWeight: FontWeight.bold),
      headline5: TextStyle(
          fontSize: 18,
          fontFamily: 'RobotoCondensed',
          fontWeight: FontWeight.bold),
      headline6: TextStyle(
          fontSize: 17,
          fontFamily: 'RobotoCondensed',
          fontWeight: FontWeight.bold),
    ),
  );
}
