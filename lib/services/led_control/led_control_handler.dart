import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rgb_control/bloc/brightness_bloc/brightness_bloc.dart';
import 'package:rgb_control/bloc/color_picker_bloc/color_picker_bloc.dart';
import 'package:rgb_control/bloc/color_picker_bloc/color_picker_event.dart';
import 'package:rgb_control/bloc/mode_bloc/mode_bloc.dart';
import 'package:rgb_control/bloc/power_bloc/power_bloc.dart';
import 'package:rgb_control/bloc/rate/rate_bloc.dart';
import 'package:rgb_control/models/led_state.dart';
import 'package:rgb_control/models/rgb.dart';

// TODO Change to cleaner code.
void ledControlHandler({
  required BuildContext context,
  required LedState ledState
}) {

  // Handling brightness level -------------------------------------------------
  BrightnessBloc brightnessBloc = BlocProvider.of<BrightnessBloc>(context);
  brightnessBloc.add(BrightnessSetEvent(
      inner: true, level: ledState.brightness
  ));

  // Handling color picker -----------------------------------------------------
  BlocProvider.of<ColorPickerBloc>(context).add(ColorPickerSetEvent(
      inner: true,
      color: RGB.rgbToHex(rgb: ledState.rgb.toList()),
      brightness: brightnessBloc.state
  ));

  // Handling rate -------------------------------------------------------------
  BlocProvider.of<RateBloc>(context).add(RateSetEvent(
      inner: true, level: ledState.rate
  ));

  // Handling power ( on/off ) -------------------------------------------------
  PowerBloc powerBloc = BlocProvider.of<PowerBloc>(context);
  if (ledState.state == LedStateEnum.off) {
    powerBloc.add(PowerOffEvent(inner: true));
  } else {
    powerBloc.add(PowerOnEvent(inner: true));
  }

  // Handling mode -------------------------------------------------------------
  ModeSetBloc modeSetBloc = BlocProvider.of<ModeSetBloc>(context);
  if (ledState.mode == null) {
    modeSetBloc.reset();
  } else {
    modeSetBloc.add(ModeSetEvent(inner: true, modeId: ledState.mode!));
  }
}
