import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rgb_control/bloc/color_bloc/color_bloc.dart';
import 'package:rgb_control/bloc/color_bloc/color_state.dart';
import 'package:rgb_control/utils/app_constants.dart';

class PowerButtonWidget extends StatefulWidget {
  const PowerButtonWidget({Key? key}) : super(key: key);

  @override
  State<PowerButtonWidget> createState() => _PowerButtonWidgetState();
}

class _PowerButtonWidgetState extends State<PowerButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ColorPowerBloc(),
      child: BlocBuilder<ColorPowerBloc, ColorState>(
        builder: (context, state) => ClipOval(
            child: Material(
          color: state is ColorPowerOnState
              ? Styles.secondColor
              : Styles.primaryColor,
          child: InkWell(
            splashColor: state is ColorPowerOnState
                ? Styles.primaryColor
                : Styles.secondColor,
            splashFactory: InkRipple.splashFactory,
            onTap: () {
              HapticFeedback.vibrate();
              context.read<ColorPowerBloc>().switching(state);
            },
            child: const Icon(
              Icons.offline_bolt_rounded,
              size: 64,
            ),
          ),
        )),
      ),
    );
  }
}
