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

abstract class BaseLedControlHandler {
  BuildContext context;
  LedState ledState;

  BaseLedControlHandler({required this.context, required this.ledState}) {
    handle();
  }

  Bloc _getBloc();

  void handle();
}

// Handling brightness level ---------------------------------------------------

class LedControlBrightnessHandler extends BaseLedControlHandler {
  LedControlBrightnessHandler(
      {required super.context, required super.ledState});

  @override
  BrightnessBloc _getBloc() {
    return BlocProvider.of<BrightnessBloc>(context);
  }

  @override
  void handle() {
    BrightnessBloc brightnessBloc = _getBloc();
    brightnessBloc.add(BrightnessInnerSetEvent(level: ledState.brightness));
  }
}

// Handling color picker -------------------------------------------------------

class LedControlColorPickerHandler extends BaseLedControlHandler {
  LedControlColorPickerHandler(
      {required super.context, required super.ledState});

  @override
  ColorPickerBloc _getBloc() {
    return BlocProvider.of<ColorPickerBloc>(context);
  }

  @override
  void handle() {
    ColorPickerBloc colorPickerBloc = _getBloc();
    colorPickerBloc.add(ColorPickerInnerSetEvent(
      color: RGB.rgbToHex(rgb: ledState.rgb.toList()),
    ));
  }
}

// Handling rate ---------------------------------------------------------------

class LedControlRateHandler extends BaseLedControlHandler {
  LedControlRateHandler({required super.context, required super.ledState});

  @override
  RateBloc _getBloc() {
    return BlocProvider.of<RateBloc>(context);
  }

  @override
  void handle() {
    RateBloc rateBloc = _getBloc();
    rateBloc.add(RateInnerSetEvent(level: ledState.rate));
  }
}

// Handling power ( on/off ) ---------------------------------------------------

class LedControlPowerHandler extends BaseLedControlHandler {
  LedControlPowerHandler({required super.context, required super.ledState});

  @override
  PowerBloc _getBloc() {
    return BlocProvider.of<PowerBloc>(context);
  }

  @override
  void handle() {
    PowerBloc powerBloc = _getBloc();
    if (ledState.state == LedStateEnum.off) {
      powerBloc.add(PowerInnerOffEvent());
    } else {
      powerBloc.add(PowerInnerOnEvent());
    }
  }
}

// Handling mode ---------------------------------------------------------------

class LedControlModeHandler extends BaseLedControlHandler {
  LedControlModeHandler({required super.context, required super.ledState});

  @override
  ModeSetBloc _getBloc() {
    return BlocProvider.of<ModeSetBloc>(context);
  }

  @override
  void handle() {
    ModeSetBloc modeSetBloc = _getBloc();
    if (ledState.mode == null) {
      modeSetBloc.reset();
    } else {
      modeSetBloc.add(ModeInnerSetEvent(modeId: ledState.mode!));
    }
  }
}

void ledControlHandler(
    {required BuildContext context, required LedState ledState}) {
  LedControlBrightnessHandler(context: context, ledState: ledState);
  LedControlColorPickerHandler(context: context, ledState: ledState);
  LedControlRateHandler(context: context, ledState: ledState);
  LedControlPowerHandler(context: context, ledState: ledState);
  LedControlModeHandler(context: context, ledState: ledState);
}
