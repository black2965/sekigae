// ignore_for_file: constant_identifier_names
import 'package:flutter/material.dart';

class AppTheme {
  static const Color white_text_color = Colors.white;
  static const Color text_color = black;
  static const Color background_color = white;
  static const Color primary_color = Color.fromRGBO(196, 202, 208,1);
  static const Color floating_button_color = mcgpalette0;
  static const Color box_color = mcgpalette0Accent;
  static const MaterialColor app_primarySwatch_color = mcgpalette0;
  static const Color app_bar_color = blue;

  static const Color link = blue;

  static const Color white = Color.fromRGBO(246, 244, 242,1);
  static const Color blue = Color.fromRGBO(48, 71, 94,1);
  static const Color black = Color.fromRGBO(34, 40, 49,1);

  static const MaterialColor mcgpalette0 = MaterialColor(_mcgpalette0PrimaryValue, <int, Color>{
    50: Color(0xFFE9EAED),
    100: Color(0xFFC8CAD2),
    200: Color(0xFFA3A7B4),
    300: Color(0xFF7E8395),
    400: Color(0xFF63697F),
    500: Color(_mcgpalette0PrimaryValue),
    600: Color(0xFF404760),
    700: Color(0xFF373D55),
    800: Color(0xFF2F354B),
    900: Color(0xFF20253A),
  });
  static const int _mcgpalette0PrimaryValue = 0xFF474E68;

  static const MaterialColor mcgpalette0Accent = MaterialColor(_mcgpalette0AccentValue, <int, Color>{
    100: Color(0xFF8096FF),
    200: Color(_mcgpalette0AccentValue),
    400: Color(0xFF1A42FF),
    700: Color(0xFF012DFF),
  });
  static const int _mcgpalette0AccentValue = 0xFF4D6CFF;


  static Color rgb(int r, int g, int b){
    return Color.fromRGBO(r, g, b, 1);
  }
}
