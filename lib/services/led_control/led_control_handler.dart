import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rgb_control/bloc/brightness_level_bloc/brightness_level_bloc.dart';
import 'package:rgb_control/bloc/color_palette_bloc/color_palette_bloc.dart';
import 'package:rgb_control/bloc/mode_bloc/mode_bloc.dart';
import 'package:rgb_control/bloc/power_bloc/power_bloc.dart';
import 'package:rgb_control/bloc/rate/rate_bloc.dart';
import 'package:rgb_control/models/led_state.dart';

void handler({required BuildContext context, required LedState ledState}) {
  List<dynamic> rgb = ledState.rgb.toList();

  BlocProvider.of<ColorPaletteBloc>(context)
      .emit(Color.fromRGBO(rgb[0], rgb[1], rgb[2], 1));
  BlocProvider.of<BrightnessLevelBloc>(context).emit(ledState.brightness);
  BlocProvider.of<RateBloc>(context).emit(ledState.rate);
  BlocProvider.of<ModeSetBloc>(context)
      .emit(ModeSetState(modeId: ledState.mode));

  PowerBloc powerBloc = BlocProvider.of<PowerBloc>(context);
    if (ledState.state == LedStateEnum.off.index) {
    powerBloc.emit(PowerOffState());
  } else {
      powerBloc.emit(PowerOnState());
    }
}
