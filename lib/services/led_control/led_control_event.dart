import 'package:rgb_control/services/led_control/led_control_websocket.dart';

enum LedControlEventEnum { off, on, setColor, setMode, setBrightness, setRate }

class LedControlWsEvent {
  static WebSocketManager ws = WebSocketManager();

  static off() {
    ws.addEvent({'event': LedControlEventEnum.off.index});
  }

  static on() {
    ws.addEvent({'event': LedControlEventEnum.on.index});
  }

  static setColor({required List<int> rgb, required double brightness}) {
    ws.addEvent({
      'event': LedControlEventEnum.setColor.index,
      'rgb': rgb,
      'brightness': brightness
    });
  }

  static setBrightness({required brightness}) {
    ws.addEvent({
      'event': LedControlEventEnum.setBrightness.index,
      'brightness': brightness
    });
  }

  static setRate({required rate}) {
    ws.addEvent({'event': LedControlEventEnum.setRate.index, 'rate': rate});
  }

  static setMode(
      {required int modeId, required double rate, required double brightness}) {
    ws.addEvent({
      'event': LedControlEventEnum.setMode.index,
      'mode': modeId,
      'brightness': brightness,
      'rate': rate
    });
  }
}
