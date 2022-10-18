import 'package:flutter/material.dart';
import 'package:rgb_control/utils/app_constants.dart';

class BrightnessLevelWidget extends StatefulWidget {
  const BrightnessLevelWidget({Key? key}) : super(key: key);

  @override
  State<BrightnessLevelWidget> createState() => _BrightnessLevelWidgetState();
}

class _BrightnessLevelWidgetState extends State<BrightnessLevelWidget> {

  double _currentSliderValue = 100;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const <Widget>[
            Text(
              Texts.brightnessLevelTitle,
              style: Styles.primaryTextStyle,
            ),
            Icon(
              Icons.lightbulb_outline_rounded,
              color: Styles.primaryColor,
              size: 26,
            )
          ],
        ),
        const SizedBox(height: 20,),
        SliderTheme(
          data: SliderThemeData(overlayShape: SliderComponentShape.noOverlay),
          child: Slider.adaptive(
              value: _currentSliderValue,
              min: 0.1,
              max: 100,
              thumbColor: Styles.primaryColor,
              activeColor: Styles.secondColor,
              inactiveColor: Styles.secondColor,
              onChanged: (double value) {
                setState(() {
                  _currentSliderValue = value;
                });
              }
          ),
        )
      ],
    );
  }
}