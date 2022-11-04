import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rgb_control/bloc/color_bloc/color_event.dart';
import 'package:rgb_control/bloc/color_bloc/color_state.dart';
import 'package:rgb_control/services/led_control/event.dart';
import 'package:rgb_control/services/led_control/provider.dart';
import 'package:rgb_control/utils/app_constants.dart';

class ColorPaletteBloc extends Bloc<ColorEvent, Color> {
  ColorPaletteBloc() : super(Styles.initialColorPalette) {
    on<ColorPaletteSetEvent>((event, emit) => emit(event.color));
  }
}

class ColorBrightnessLevelBloc extends Bloc<ColorEvent, double> {
  ColorBrightnessLevelBloc() : super(BrightnessLevel.initLevel) {
    on<BrightnessLevelSetEvent>((event, emit) => emit(event.level));
  }
}

class ColorPowerBloc extends Bloc<ColorEvent, ColorState> {
  ColorPowerBloc() : super(ColorPowerOffState()) {
    on<ColorPowerOnEvent>(_on_color_power_on);
    on<ColorPowerOffEvent>(_on_color_power_off);
  }

  void _on_color_power_on(ColorPowerOnEvent event, Emitter<ColorState> emit) {
    WebSocketManager().addEvent(Event().on());
    emit(ColorPowerOnState());
  }

  void _on_color_power_off(ColorPowerOffEvent event, Emitter<ColorState> emit) {
    WebSocketManager().addEvent(Event().off());
    emit(ColorPowerOffState());
  }

  void switching(ColorState state) {
    if (state is ColorPowerOffState) {
      add(ColorPowerOnEvent());
    } else {
      add(ColorPowerOffEvent());
    }
  }
}
