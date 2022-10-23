import 'package:flutter/material.dart';

abstract class ColorEvent {}

class ColorPaletteSetEvent extends ColorEvent {
  Color color;

  ColorPaletteSetEvent({required this.color});
}

class BrightnessLevelSetEvent extends ColorEvent {
  double level;

  BrightnessLevelSetEvent({required this.level});
}

class ColorPowerOnEvent extends ColorEvent {}

class ColorPowerOffEvent extends ColorEvent {}
