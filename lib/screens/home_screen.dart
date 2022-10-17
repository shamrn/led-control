import 'package:flutter/material.dart';
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
              children: const <Widget>[
                ColorPaletteWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
