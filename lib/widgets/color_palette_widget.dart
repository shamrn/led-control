import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:rgb_control/bloc/color_palette_bloc/color_palette_bloc.dart';
import 'package:rgb_control/bloc/color_palette_bloc/color_palette_event.dart';
import 'package:rgb_control/bloc/color_palette_bloc/color_palette_state.dart';

class ColorPaletteWidget extends StatefulWidget {
  const ColorPaletteWidget({Key? key}) : super(key: key);

  @override
  State<ColorPaletteWidget> createState() => _ColorPaletteWidgetState();
}

class _ColorPaletteWidgetState extends State<ColorPaletteWidget> {
  void changeColor(Color color) {
    ColorBloc().add(ColorPaletteSetEvent(pickerColor: color));
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ColorBloc(),
      child: BlocBuilder<ColorBloc, ColorPaletteState>(
        builder: (context, state) => ColorPicker(
          pickerColor: state.pickerColor,
          onColorChanged: changeColor,
          colorPickerWidth: MediaQuery.of(context).size.width,
          pickerAreaHeightPercent: 1,
          paletteType: PaletteType.hsv,
          labelTypes: const [],
          enableAlpha: false,
        ),
      ),
    );
  }
}
