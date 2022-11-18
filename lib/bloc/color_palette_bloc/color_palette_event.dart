import 'package:flutter/material.dart';

abstract class ColorPaletteEvent {}

class ColorPaletteSetEvent extends ColorPaletteEvent {
  bool inner;
  Color color;
  double brightness;

  ColorPaletteSetEvent(
      {this.inner = false, required this.color, required this.brightness});
}
