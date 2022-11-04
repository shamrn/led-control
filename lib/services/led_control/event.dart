enum EventEnum { off, on, setColor, setMode, setBrightnessLevel }

class Event {

  Map<String, int> off() {
    return {'event': EventEnum.off.index};
  }

  Map<String, int> on() {
    return {'event': EventEnum.on.index};
  }

  Map<String, dynamic> setColor(List<int> rgb, double brightnessLevel) {
    return {
      'event': EventEnum.setColor.index,
      'rgb': rgb,
      'brightness_level': brightnessLevel
    };
  }
}
