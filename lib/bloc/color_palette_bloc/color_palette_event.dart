import 'package:flutter/material.dart';

abstract class ColorPaletteEvent {}

class ColorPaletteSetEvent extends ColorPaletteEvent {
  bool inner;
  Color color;
  double brightnessLevel;

  ColorPaletteSetEvent(
      {this.inner = false, required this.color, required this.brightnessLevel});
}
