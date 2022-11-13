import 'package:flutter/material.dart';

// Api
class Api {
  static late String host;
  static late String port;
  static String wsUri = 'ws://$host:$port/';
  static String httpUri = 'http://$host:$port/api/v1/';

  static const ledControlWsEndpoint = 'ws/api/leds/';
  static const modeEndpoint = 'leds/modes/';

  // mock data
  static const authHeader = {
    'Authorization': 'Token d1d7336fa886bd0db6bea425fa653f0e3ad79f21'
  };
  static const poolQuery = 'pool_id=1';
}

// Texts
class Texts {
  static const String brightnessLevelTitle = 'Яркость';
  static const String modeTitle = 'Режимы';
  static const String rateTitle = 'Скорость';
  static const String rateHelpText = 'Скорость применяться только для режимов';

  static const String validationRequiredFieldText = 'Обязательное поле.';
  static const String ipFieldName = 'Ip';
  static const String portFieldName = 'Порт';
  static const String connectButtonText = 'Подключиться';
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

  static SliderThemeData sliderThemData = SliderThemeData(
    overlayShape: SliderComponentShape.noOverlay,
    showValueIndicator: ShowValueIndicator.always,
    valueIndicatorColor: Styles.secondColor.withOpacity(0.4),
  );
}

// Brightness Level
class BrightnessLevel {
  static const double maxLevel = 100.0;
  static const double minLevel = 0.1;
  static const double initLevel = maxLevel;
}

// Rate
class Rate {
  static const double maxLevel = 100.0;
  static const double minLevel = 0.1;
  static const double initLevel = 50.0;
}
