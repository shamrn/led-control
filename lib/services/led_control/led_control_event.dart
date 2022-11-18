enum EventEnum { off, on, setColor, setMode, setBrightness, setRate }

class Event {
  static Map<String, int> off() {
    return {'event': EventEnum.off.index};
  }

  static Map<String, int> on() {
    return {'event': EventEnum.on.index};
  }

  static Map<String, dynamic> setColor(
      {required List<int> rgb, required double brightness}) {
    return {
      'event': EventEnum.setColor.index,
      'rgb': rgb,
      'brightness': brightness
    };
  }

  static Map<String, dynamic> setBrightness({required brightness}) {
    return {
      'event': EventEnum.setBrightness.index,
      'brightness': brightness
    };
  }

  static Map<String, dynamic> setRate({required rate}) {
    return {'event': EventEnum.setRate.index, 'rate': rate};
  }

  static Map<String, dynamic> setMode(
      {required int modeId,
      required double rate,
      required double brightness}) {
    return {
      'event': EventEnum.setMode.index,
      'mode': modeId,
      'brightness': brightness,
      'rate': rate
    };
  }
}
