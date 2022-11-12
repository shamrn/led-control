import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rgb_control/bloc/brightness_level_bloc/brightness_level_bloc.dart';
import 'package:rgb_control/bloc/color_palette_bloc/color_palette_bloc.dart';
import 'package:rgb_control/bloc/color_palette_bloc/color_palette_event.dart';
import 'package:rgb_control/bloc/mode_bloc/mode_bloc.dart';
import 'package:rgb_control/bloc/power_bloc/power_bloc.dart';
import 'package:rgb_control/bloc/rate/rate_bloc.dart';
import 'package:rgb_control/models/led_state.dart';
import 'package:rgb_control/models/rgb.dart';

// TODO Change to cleaner code.
void ledControlHandler(
    {required BuildContext context, required LedState ledState}) {
  BrightnessLevelBloc brightnessLevelBloc =
      BlocProvider.of<BrightnessLevelBloc>(context);
  brightnessLevelBloc
      .add(BrightnessLevelSetEvent(inner: true, level: ledState.brightness));

  BlocProvider.of<ColorPaletteBloc>(context).add(ColorPaletteSetEvent(
      inner: true,
      color: RGB().rgbToHex(rgb: ledState.rgb.toList()),
      brightnessLevel: brightnessLevelBloc.state));

  BlocProvider.of<RateBloc>(context)
      .add(RateSetEvent(inner: true, level: ledState.rate));

  PowerBloc powerBloc = BlocProvider.of<PowerBloc>(context);
  if (ledState.state == LedStateEnum.off.index) {
    powerBloc.add(PowerOffEvent(inner: true));
  } else {
    powerBloc.add(PowerOnEvent(inner: true));
  }

  ModeSetBloc modeSetBloc = BlocProvider.of<ModeSetBloc>(context);

  if (ledState.mode == null) {
    modeSetBloc.reset();
  } else {
    modeSetBloc.add(ModeSetEvent(inner: true, modeId: ledState.mode!));
  }
}
