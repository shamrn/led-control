import 'package:flutter/material.dart';

// Texts
class Texts {
  static const String brightnessLevelTitle = 'Яркость';
}

// Styles
class Styles {
  static const Color primaryColor = Color(0xfff4fbff);
  static const Color secondColor = Color(0xff2185ca);

  static const Color initialColorPalette = Color(0xff416981);

  static const TextStyle primaryTextStyle =
      TextStyle(color: primaryColor, fontSize: 22);
}


// Brightness Level
class BrightnessLevel {
  static const double maxLevel = 100;
  static const double minLevel = 0.1;
  static const double initLevel = maxLevel;
}
