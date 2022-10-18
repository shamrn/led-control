import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rgb_control/bloc/color_palette_bloc/color_palette_event.dart';
import 'package:rgb_control/bloc/color_palette_bloc/color_palette_state.dart';

class ColorBloc extends Bloc<ColorPaletteEvent, ColorPaletteState> {
  ColorBloc() : super(ColorPaletteInitialState()) {
    on<ColorPaletteSetEvent>((event, emit) async {
      emit(ColorPaletteSetState(pickerColor: event.pickerColor));
    });
  }}
