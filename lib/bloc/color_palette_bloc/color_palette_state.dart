import 'package:flutter/material.dart';

abstract class ColorPaletteState {
  final Color pickerColor;

  ColorPaletteState({required this.pickerColor});
}

class ColorPaletteInitialState extends ColorPaletteState {
  ColorPaletteInitialState() : super(pickerColor: const Color(0xffffffff));
}

class ColorPaletteSetState extends ColorPaletteState {
  ColorPaletteSetState({required pickerColor})
      : super(pickerColor: pickerColor);
}
