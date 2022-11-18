import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:rgb_control/bloc/brightness_bloc/brightness_bloc.dart';
import 'package:rgb_control/bloc/color_picker_bloc/color_picker_bloc.dart';
import 'package:rgb_control/bloc/color_picker_bloc/color_picker_event.dart';
import 'package:rgb_control/bloc/mode_bloc/mode_bloc.dart';
import 'package:rgb_control/bloc/power_bloc/power_bloc.dart';

class ColorPickerWidget extends StatefulWidget {
  const ColorPickerWidget({Key? key}) : super(key: key);

  @override
  State<ColorPickerWidget> createState() => _ColorPickerWidgetState();
}

class _ColorPickerWidgetState extends State<ColorPickerWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ColorPickerBloc, Color>(
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
    ColorPickerBloc().add(ColorPickerSetEvent(
        color: color,
        brightness: BlocProvider.of<BrightnessBloc>(context).state));
  }
}
