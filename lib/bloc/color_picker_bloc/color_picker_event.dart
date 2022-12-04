import 'package:flutter/material.dart';

abstract class ColorPickerEvent {
  Color color;

  ColorPickerEvent({required this.color});
}

class ColorPickerSetEvent extends ColorPickerEvent {
  double brightness;

  ColorPickerSetEvent({required super.color, required this.brightness});
}

class ColorPickerInnerSetEvent extends ColorPickerEvent {
  ColorPickerInnerSetEvent({required super.color});
}
