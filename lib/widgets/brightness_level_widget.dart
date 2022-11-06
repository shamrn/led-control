import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rgb_control/bloc/brightness_level_bloc/brightness_level_bloc.dart';
import 'package:rgb_control/utils/app_constants.dart';
import 'package:rgb_control/widgets/section_widget.dart';

class BrightnessLevelWidget extends StatelessWidget {
  const BrightnessLevelWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const <Widget>[
        SectionWidget(
            title: Texts.brightnessLevelTitle, icon: Icons.light_mode_sharp),
        SizedBox(
          height: 10,
        ),
        SliderBrightnessLevel()
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
      data: Styles.sliderThemData,
      child: BlocBuilder<BrightnessLevelBloc, double>(
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
                  .read<BrightnessLevelBloc>()
                  .add(BrightnessLevelSetEvent(level: level));
            }),
      ),
    );
  }
}
