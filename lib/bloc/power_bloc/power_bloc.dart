import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rgb_control/services/led_control/led_control_event.dart';

part 'power_event.dart';
part 'power_state.dart';

class PowerBloc extends Bloc<PowerEvent, PowerState> {
  PowerBloc() : super(PowerOffState()) {
    on<PowerOnEvent>(_onPowerOn);
    on<PowerOffEvent>(_onPowerOff);

    on<PowerInnerOnEvent>(_onInnerPowerOn);
    on<PowerInnerOffEvent>(_onInnerPowerOff);
  }

  void _onPowerOn(PowerOnEvent event, Emitter<PowerState> emit) {
    LedControlWsEvent.on();
    emit(PowerOnState());
  }

  void _onPowerOff(PowerOffEvent event, Emitter<PowerState> emit) {
    LedControlWsEvent.off();
    emit(PowerOffState());
  }

  void _onInnerPowerOn(PowerInnerOnEvent event, Emitter<PowerState> emit) {
    emit(PowerOnState());
  }

  void _onInnerPowerOff(PowerInnerOffEvent event, Emitter<PowerState> emit) {
    emit(PowerOffState());
  }

  void switching(PowerState state) {
    if (state is PowerOffState) {
      add(PowerOnEvent());
    } else {
      add(PowerOffEvent());
    }
  }
}
