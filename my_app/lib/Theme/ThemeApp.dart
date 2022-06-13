import 'package:flutter/material.dart';
import 'ColorsThemeApp.dart';

class ThemeApp {
  static ThemeData Theme = ThemeData(
      primarySwatch: ColorsThemeApp.primaryColor,
      accentColor: ColorsThemeApp.accentColor,
      fontFamily: 'Quicksand',
      // textTheme: ThemeData.light().textTheme.copyWith(
      //     titleMedium: const TextStyle(
      //         fontFamily: 'OpenSans',
      //         fontWeight: FontWeight.bold,
      //         fontSize: 18),
      //     button: const TextStyle(color: Colors.white)),
      appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(
              fontFamily: 'OpenSans',
              fontSize: 20,
              fontWeight: FontWeight.bold)));
}
