import 'package:eva_icons_flutter/eva_icons_flutter.dart';
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
    return BlocBuilder<ColorPowerBloc, ColorState>(
      builder: (context, state) => ClipOval(
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {
              HapticFeedback.vibrate();
              context.read<ColorPowerBloc>().switching(state);
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(width: 2.4, color: _getColor(state))),
              child: Icon(
                state is ColorPowerOffState
                    ? EvaIcons.flashOffOutline
                    : EvaIcons.flashOutline,
                color: _getColor(state),
                size: 50,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Color _getColor(ColorState state) {
    return state is ColorPowerOnState
        ? Styles.secondColor
        : Styles.primaryColor;
  }
}
