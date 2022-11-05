enum EventEnum { off, on, setColor, setMode, setBrightnessLevel }

class Event {
  Map<String, int> off() {
    return {'event': EventEnum.off.index};
  }

  Map<String, int> on() {
    return {'event': EventEnum.on.index};
  }

  Map<String, dynamic> setColor(
      {required List<int> rgb, required double brightnessLevel}) {
    return {
      'event': EventEnum.setColor.index,
      'rgb': rgb,
      'brightness_level': brightnessLevel
    };
  }

  Map<String, dynamic> setBrightnessLevel({required brightnessLevel}) {
    return {
      'event': EventEnum.setBrightnessLevel.index,
      'brightness_level': brightnessLevel
    };
  }

  Map<String, dynamic> setMode(
      {required int modeId,
      required double rate,
      required double brightnessLevel}) {
    return {
      'event': EventEnum.setMode.index,
      'mode': modeId,
      'brightness_level': brightnessLevel,
      'rate': rate
    };
  }
}
