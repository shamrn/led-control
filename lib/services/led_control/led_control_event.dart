enum EventEnum { off, on, setColor, setMode, setBrightnessLevel, setRate }

class Event {
  static Map<String, int> off() {
    return {'event': EventEnum.off.index};
  }

  static Map<String, int> on() {
    return {'event': EventEnum.on.index};
  }

  static Map<String, dynamic> setColor(
      {required List<int> rgb, required double brightnessLevel}) {
    return {
      'event': EventEnum.setColor.index,
      'rgb': rgb,
      'brightness': brightnessLevel
    };
  }

  static Map<String, dynamic> setBrightnessLevel({required brightnessLevel}) {
    return {
      'event': EventEnum.setBrightnessLevel.index,
      'brightness': brightnessLevel
    };
  }

  static Map<String, dynamic> setRate({required rate}) {
    return {'event': EventEnum.setRate.index, 'rate': rate};
  }

  static Map<String, dynamic> setMode(
      {required int modeId,
      required double rate,
      required double brightnessLevel}) {
    return {
      'event': EventEnum.setMode.index,
      'mode': modeId,
      'brightness': brightnessLevel,
      'rate': rate
    };
  }
}
