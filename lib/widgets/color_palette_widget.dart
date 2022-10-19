import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:rgb_control/bloc/color_bloc/color_bloc.dart';
import 'package:rgb_control/bloc/color_bloc/color_event.dart';
import 'package:rgb_control/bloc/color_bloc/color_state.dart';

class ColorPaletteWidget extends StatefulWidget {
  const ColorPaletteWidget({Key? key}) : super(key: key);

  @override
  State<ColorPaletteWidget> createState() => _ColorPaletteWidgetState();
}

class _ColorPaletteWidgetState extends State<ColorPaletteWidget> {
  void changeColor(Color color) {
    ColorPaletteBloc().add(ColorPaletteSetEvent(color: color));
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ColorPaletteBloc(),
      child: BlocBuilder<ColorPaletteBloc, ColorPaletteState>(
        builder: (context, state) => ColorPicker(
          pickerColor: state.currentColor,
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
