import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rgb_control/bloc/color_palette_bloc/color_palette_event.dart';
import 'package:rgb_control/models/rgb.dart';
import 'package:rgb_control/services/led_control/led_control_event.dart';
import 'package:rgb_control/services/led_control/led_control_websocket.dart';
import 'package:rgb_control/utils/app_constants.dart';

class ColorPaletteBloc extends Bloc<ColorPaletteEvent, Color> {
  ColorPaletteBloc() : super(Styles.initialColorPalette) {
    on<ColorPaletteSetEvent>(_onColorPaletteSet);
  }

  void _onColorPaletteSet(ColorPaletteSetEvent event, Emitter<Color> emit) {
    if (!event.inner) {
      WebSocketManager().addEvent(Event.setColor(
          rgb: RGB.colorToRgb(color: event.color),
          brightnessLevel: event.brightnessLevel));
    }
    emit(event.color);
  }
}
