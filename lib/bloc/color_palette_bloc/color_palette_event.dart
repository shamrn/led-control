import 'package:flutter/material.dart';

abstract class ColorPaletteEvent {}


class ColorPaletteSetEvent extends ColorPaletteEvent {
  Color pickerColor;

  ColorPaletteSetEvent({required this.pickerColor});
}
