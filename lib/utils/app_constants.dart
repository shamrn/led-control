import 'package:flutter/material.dart';

// Api
class Api {
  static const host = 'ws://192.168.0.13';
  static const port = '8765';
}

// Texts
class Texts {
  static const String brightnessLevelTitle = 'Яркость';
  static const String modeTitle = 'Режимы';
}

// Styles
class Styles {
  static const Color canvasColor = Color(0xff000000);
  static const Color primaryColor = Color(0xfff4fbff);
  static const Color secondColor = Color(0xff2185ca);

  static const Color initialColorPalette = Color(0xff416981);

  static const TextStyle primaryTextStyle =
      TextStyle(color: primaryColor, fontSize: 22);

  static const double horizontalPrimaryPadding = 20;
  static const double bottomPrimaryPadding = 40;
  static const double modeCardSpacing = 8;
}


// Brightness Level
class BrightnessLevel {
  static const double maxLevel = 100;
  static const double minLevel = 0.1;
  static const double initLevel = maxLevel;
}
