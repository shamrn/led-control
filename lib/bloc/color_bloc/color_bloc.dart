import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rgb_control/bloc/color_bloc/color_event.dart';
import 'package:rgb_control/bloc/color_bloc/color_state.dart';

class ColorPaletteBloc extends Bloc<ColorEvent, ColorPaletteState> {
  ColorPaletteBloc() : super(ColorPaletteInitialState()) {
    on<ColorPaletteSetEvent>((event, emit) async {
      emit(ColorPaletteSetState(currentColor: event.color));
    });
  }
}

class ColorBrightnessLevelBloc
    extends Bloc<ColorEvent, ColorBrightnessLevelState> {
  ColorBrightnessLevelBloc() : super(ColorBrightnessLevelInitialState()) {
    on<BrightnessLevelSetEvent>((event, emit) async {
      emit(ColorBrightnessLevelSetState(level: event.level));
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
