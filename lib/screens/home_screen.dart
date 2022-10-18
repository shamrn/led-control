import 'package:flutter/material.dart';
import 'package:rgb_control/widgets/brightness_level_widget.dart';
import 'package:rgb_control/widgets/color_palette_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: SingleChildScrollView(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const <Widget>[
              ColorPaletteWidget(),
              SizedBox(
                height: 10,
              ),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: BrightnessLevelWidget()),
            ]),
      ),
    )));
  }
}
