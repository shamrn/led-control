import 'package:flutter/material.dart';

abstract class ColorPickerEvent {}

class ColorPickerSetEvent extends ColorPickerEvent {
  bool inner;
  Color color;
  double brightness;

  ColorPickerSetEvent(
      {this.inner = false, required this.color, required this.brightness});
}
