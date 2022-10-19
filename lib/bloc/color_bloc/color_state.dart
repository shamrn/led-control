import 'package:flutter/material.dart';
import 'package:rgb_control/utils/app_constants.dart';

abstract class ColorState {}

// Palette bloc
class ColorPaletteState extends ColorState {
  final Color currentColor;

  ColorPaletteState({required this.currentColor});
}

class ColorPaletteInitialState extends ColorPaletteState {
  ColorPaletteInitialState() : super(currentColor: Styles.initialColorPalette);
}

class ColorPaletteSetState extends ColorPaletteState {
  ColorPaletteSetState({required currentColor})
      : super(currentColor: currentColor);
}

// Brightness level bloc
class ColorBrightnessLevelState extends ColorState {
  double level;

  ColorBrightnessLevelState({required this.level});
}

class ColorBrightnessLevelInitialState extends ColorBrightnessLevelState {
  ColorBrightnessLevelInitialState() : super(level: BrightnessLevel.initLevel);
}

class ColorBrightnessLevelSetState extends ColorBrightnessLevelState {
  ColorBrightnessLevelSetState({required level}) : super(level: level);
}
