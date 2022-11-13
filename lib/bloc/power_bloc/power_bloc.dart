import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rgb_control/services/led_control/led_control_event.dart';
import 'package:rgb_control/services/led_control/led_control_websocket.dart';

part 'power_event.dart';

part 'power_state.dart';

class PowerBloc extends Bloc<PowerEvent, PowerState> {
  PowerBloc() : super(PowerOffState()) {
    on<PowerOnEvent>(_onColorPowerOn);
    on<PowerOffEvent>(_onColorPowerOff);
  }

  void _onColorPowerOn(PowerOnEvent event, Emitter<PowerState> emit) {
    if (!event.inner) WebSocketManager().addEvent(Event.on());
    emit(PowerOnState());
  }

  void _onColorPowerOff(PowerOffEvent event, Emitter<PowerState> emit) {
    if (!event.inner) WebSocketManager().addEvent(Event.off());
    emit(PowerOffState());
  }

  void setInnerOn() {
    if (state is PowerOffState) add(PowerOnEvent(inner: true));
  }

  void switching(PowerState state) {
    if (state is PowerOffState) {
      add(PowerOnEvent());
    } else {
      add(PowerOffEvent());
    }
  }
}
