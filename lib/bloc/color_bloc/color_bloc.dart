import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rgb_control/bloc/color_bloc/color_event.dart';
import 'package:rgb_control/bloc/color_bloc/color_state.dart';
import 'package:rgb_control/utils/app_constants.dart';

class ColorPaletteBloc extends Bloc<ColorEvent, Color> {
  ColorPaletteBloc() : super(Styles.initialColorPalette) {
    on<ColorPaletteSetEvent>((event, emit) async {
      emit(event.color);
    });
  }
}

class ColorBrightnessLevelBloc extends Bloc<ColorEvent, double> {
  ColorBrightnessLevelBloc() : super(BrightnessLevel.initLevel) {
    on<BrightnessLevelSetEvent>((event, emit) async {
      emit(event.level);
    });
  }
}

class ColorPowerBloc extends Bloc<ColorEvent, ColorState> {
  ColorPowerBloc() : super(ColorPowerOffState()) {
    on<ColorPowerOnEvent>((event, emit) => emit(ColorPowerOnState()));
    on<ColorPowerOffEvent>((event, emit) => emit(ColorPowerOffState()));
  }

  void switching(ColorState state) {
    if (state is ColorPowerOffState) {
      add(ColorPowerOnEvent());
    } else {
      add(ColorPowerOffEvent());
    }
  }
}
