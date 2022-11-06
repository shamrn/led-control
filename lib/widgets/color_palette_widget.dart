import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:rgb_control/bloc/brightness_level_bloc/brightness_level_bloc.dart';
import 'package:rgb_control/bloc/color_palette_bloc/color_palette_bloc.dart';
import 'package:rgb_control/bloc/color_palette_bloc/color_palette_event.dart';
import 'package:rgb_control/bloc/mode_bloc/mode_bloc.dart';
import 'package:rgb_control/bloc/power_bloc/power_bloc.dart';

class ColorPaletteWidget extends StatefulWidget {
  const ColorPaletteWidget({Key? key}) : super(key: key);

  @override
  State<ColorPaletteWidget> createState() => _ColorPaletteWidgetState();
}

class _ColorPaletteWidgetState extends State<ColorPaletteWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ColorPaletteBloc, Color>(
      builder: (context, currentColor) {
        return ColorPicker(
          pickerColor: currentColor,
          onColorChanged: (color) => _onColorChanged(
            color: color,
            context: context,
          ),
          colorPickerWidth: MediaQuery.of(context).size.width,
          pickerAreaHeightPercent: 1,
          paletteType: PaletteType.hsv,
          labelTypes: const [],
          enableAlpha: false,
        );
      },
    );
  }

  _onColorChanged({
    required Color color,
    required BuildContext context,
  }) {
    context.read<ModeSetBloc>().reset();
    context.read<PowerBloc>().setInnerOn();
    ColorPaletteBloc().add(ColorPaletteSetEvent(
        color: color,
        brightnessLevel: BlocProvider.of<BrightnessLevelBloc>(context).state));
  }
}
