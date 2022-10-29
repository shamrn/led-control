import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:rgb_control/bloc/color_bloc/color_bloc.dart';
import 'package:rgb_control/bloc/color_bloc/color_event.dart';

class ColorPaletteWidget extends StatefulWidget {
  const ColorPaletteWidget({Key? key}) : super(key: key);

  @override
  State<ColorPaletteWidget> createState() => _ColorPaletteWidgetState();
}

class _ColorPaletteWidgetState extends State<ColorPaletteWidget> {

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ColorPaletteBloc, Color>(
      builder: (context, currentColor) =>
      ColorPicker(
          pickerColor: currentColor,
          onColorChanged: (color) =>
              ColorPaletteBloc().add(ColorPaletteSetEvent(color: color)),
          colorPickerWidth: MediaQuery.of(context).size.width,
      pickerAreaHeightPercent: 1,
      paletteType: PaletteType.hsv,
      labelTypes: const [],
      enableAlpha: false,
    ),);
  }
}
