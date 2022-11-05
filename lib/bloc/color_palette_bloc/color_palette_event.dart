import 'package:flutter/material.dart';

abstract class ColorPaletteEvent {}

class ColorPaletteSetEvent extends ColorPaletteEvent {
  Color color;
  double brightnessLevel;

  ColorPaletteSetEvent({required this.color, required this.brightnessLevel});
}
