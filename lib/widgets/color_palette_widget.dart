import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class ColorPaletteWidget extends StatefulWidget {
  const ColorPaletteWidget({Key? key}) : super(key: key);

  @override
  State<ColorPaletteWidget> createState() => _ColorPaletteWidgetState();
}

class _ColorPaletteWidgetState extends State<ColorPaletteWidget> {
  Color pickerColor = const Color(0xfffffaff);

  void changeColor(Color color) {
    setState(() => pickerColor = color);
  }

  @override
  Widget build(BuildContext context) {
    return ColorPicker(
      pickerColor: pickerColor,
      onColorChanged: changeColor,
      colorPickerWidth: MediaQuery.of(context).size.width,
      pickerAreaHeightPercent: 1,
      displayThumbColor: true,
      paletteType: PaletteType.hueWheel,
      labelTypes: const [],
      enableAlpha: false,
    );
  }
}
