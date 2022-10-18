import 'package:flutter/material.dart';
import 'package:rgb_control/utils/app_constants.dart';

abstract class ColorPaletteState {
  final Color pickerColor;

  ColorPaletteState({required this.pickerColor});
}

class ColorPaletteInitialState extends ColorPaletteState {
  ColorPaletteInitialState() : super(pickerColor: Styles.initialColorPalette);
}

class ColorPaletteSetState extends ColorPaletteState {
  ColorPaletteSetState({required pickerColor})
      : super(pickerColor: pickerColor);
}
