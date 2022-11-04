import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rgb_control/bloc/led_control_bloc/led_control_event.dart';
import 'package:rgb_control/bloc/led_control_bloc/led_control_state.dart';
import 'package:rgb_control/services/led_control/event.dart';
import 'package:rgb_control/services/led_control/provider.dart';
import 'package:rgb_control/utils/app_constants.dart';

class ColorPaletteBloc extends Bloc<ColorEvent, Color> {
  ColorPaletteBloc() : super(Styles.initialColorPalette) {
    on<ColorPaletteSetEvent>((event, emit) => emit(event.color));
  }
}

class BrightnessLevelBloc extends Bloc<ColorEvent, double> {
  BrightnessLevelBloc() : super(BrightnessLevel.initLevel) {
    on<BrightnessLevelSetEvent>((event, emit) => emit(event.level));
  }
}

class PowerBloc extends Bloc<ColorEvent, ColorState> {
  PowerBloc() : super(ColorPowerOffState()) {
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
