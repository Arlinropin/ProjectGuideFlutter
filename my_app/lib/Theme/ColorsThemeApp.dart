import 'package:flutter/material.dart';

class ColorsThemeApp {
  // PRIMARY COLOR
  static const MaterialColor primaryColor =
      MaterialColor(_primaryColorValue, <int, Color>{
    50: Color(0xFFF2E0EA),
    100: Color(0xFFE0B3CA),
    200: Color(0xFFCB80A7),
    300: Color(0xFFB64D83),
    400: Color(0xFFA62669),
    500: Color(_primaryColorValue),
    600: Color(0xFF8E0047),
    700: Color(0xFF83003D),
    800: Color(0xFF790035),
    900: Color(0xFF680025),
  });
  static const int _primaryColorValue = 0xFF96004E;

  // ACCENT COLOR
  static const MaterialColor accentColor =
      MaterialColor(_accentColorValue, <int, Color>{
    50: Color(0xFFF2F9E3),
    100: Color(0xFFDFEFB9),
    200: Color(0xFFCAE48A),
    300: Color(0xFFB5D95B),
    400: Color(0xFFA5D137),
    500: Color(_accentColorValue),
    600: Color(0xFF8DC312),
    700: Color(0xFF82BC0E),
    800: Color(0xFF78B50B),
    900: Color(0xFF67A906),
  });
  static const int _accentColorValue = 0xFF95C914;
}
