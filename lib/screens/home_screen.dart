import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rgb_control/bloc/brightness_bloc/brightness_bloc.dart';
import 'package:rgb_control/bloc/color_picker_bloc/color_picker_bloc.dart';
import 'package:rgb_control/bloc/mode_bloc/mode_bloc.dart';
import 'package:rgb_control/bloc/power_bloc/power_bloc.dart';
import 'package:rgb_control/bloc/rate/rate_bloc.dart';
import 'package:rgb_control/services/led_control/led_control_websocket.dart';
import 'package:rgb_control/utils/app_constants.dart';
import 'package:rgb_control/widgets/brightness_widget.dart';
import 'package:rgb_control/widgets/color_picker_widget.dart';
import 'package:rgb_control/widgets/mode_list_widget.dart';
import 'package:rgb_control/widgets/power_button_widget.dart';
import 'package:rgb_control/widgets/rate_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider<ColorPickerBloc>(
        create: (context) => ColorPickerBloc(),
      ),
      BlocProvider<BrightnessBloc>(
          create: (context) => BrightnessBloc()),
      BlocProvider<PowerBloc>(
        create: (context) => PowerBloc(),
      ),
      BlocProvider<RateBloc>(
        create: (context) => RateBloc(),
      ),
      BlocProvider<ModeBloc>(
        create: (context) => ModeBloc()..add(ModeLoadEvent()),
      ),
      BlocProvider<ModeSetBloc>(
        create: (context) => ModeSetBloc(),
      ),
    ], child: const BodyHomeScreen());
  }
}

class BodyHomeScreen extends StatelessWidget {
  const BodyHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WebSocketManager().listen(context);
    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const ColorPickerWidget(),
              const SizedBox(
                height: 10,
              ),
              Padding(
                  padding: const EdgeInsets.only(
                      left: Styles.horizontalPrimaryPadding,
                      right: Styles.horizontalPrimaryPadding,
                      bottom: Styles.bottomPrimaryPadding),
                  child: Column(
                    children: const <Widget>[
                      BrightnessWidget(),
                      SizedBox(
                        height: 20,
                      ),
                      RateWidget(),
                      SizedBox(
                        height: 20,
                      ),
                      ModeListWidget(),
                    ],
                  )),
            ],
          ),
        )),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: const PowerButtonWidget());
  }
}
