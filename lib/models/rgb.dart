import 'package:flutter/material.dart';

class RGB {
  List<int> colorToRgb({required Color color}) {
    return [color.red, color.green, color.blue];
  }

  Color rgbToHex({required List<int> rgb}) {
    // TODO Change to a better solution
    return Color.fromRGBO(rgb[0], rgb[1], rgb[2], 1);
  }
}
