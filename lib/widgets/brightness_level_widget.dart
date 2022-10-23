import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rgb_control/bloc/color_bloc/color_bloc.dart';
import 'package:rgb_control/bloc/color_bloc/color_event.dart';
import 'package:rgb_control/utils/app_constants.dart';

class BrightnessLevelWidget extends StatelessWidget {
  const BrightnessLevelWidget({Key? key}) : super(key: key);

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
              Icons.light_mode_sharp,
              color: Styles.primaryColor,
              size: 26,
            )
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        const SliderBrightnessLevel()
      ],
    );
  }
}

class SliderBrightnessLevel extends StatefulWidget {
  const SliderBrightnessLevel({Key? key}) : super(key: key);

  @override
  State<SliderBrightnessLevel> createState() => _SliderBrightnessLevelState();
}

class _SliderBrightnessLevelState extends State<SliderBrightnessLevel> {
  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: SliderThemeData(
        overlayShape: SliderComponentShape.noOverlay,
        showValueIndicator: ShowValueIndicator.always,
        valueIndicatorColor: Styles.secondColor.withOpacity(0.4),
      ),
      child: BlocProvider(
        create: (context) => ColorBrightnessLevelBloc(),
        child: BlocBuilder<ColorBrightnessLevelBloc, double>(
          builder: (context, currentLevel) => Slider.adaptive(
              value: currentLevel,
              min: BrightnessLevel.minLevel,
              max: BrightnessLevel.maxLevel,
              label: '${currentLevel.toInt()}%',
              thumbColor: Styles.primaryColor,
              activeColor: Styles.secondColor,
              inactiveColor: Styles.secondColor.withOpacity(0.5),
              onChanged: (double level) {
                context
                    .read<ColorBrightnessLevelBloc>()
                    .add(BrightnessLevelSetEvent(level: level));
              }),
        ),
      ),
    );
  }
}
