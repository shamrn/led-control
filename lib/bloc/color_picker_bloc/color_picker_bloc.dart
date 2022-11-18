import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rgb_control/bloc/color_picker_bloc/color_picker_event.dart';
import 'package:rgb_control/models/rgb.dart';
import 'package:rgb_control/services/led_control/led_control_event.dart';
import 'package:rgb_control/services/led_control/led_control_websocket.dart';
import 'package:rgb_control/utils/app_constants.dart';

class ColorPickerBloc extends Bloc<ColorPickerEvent, Color> {
  ColorPickerBloc() : super(Styles.initialColorPicker) {
    on<ColorPickerSetEvent>(_onColorPickerSet);
  }

  void _onColorPickerSet(ColorPickerSetEvent event, Emitter<Color> emit) {
    if (!event.inner) {
      WebSocketManager().addEvent(Event.setColor(
          rgb: RGB.colorToRgb(color: event.color),
          brightness: event.brightness));
    }
    emit(event.color);
  }
}
