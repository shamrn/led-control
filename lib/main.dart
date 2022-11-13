import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rgb_control/screens/conf_entry_screen.dart';
import 'package:rgb_control/screens/home_screen.dart';
import 'package:rgb_control/utils/app_constants.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Styles.canvasColor,
        systemNavigationBarColor: Styles.canvasColor));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(canvasColor: Styles.canvasColor),
      initialRoute: '/',
      routes: {
        '/': (context) => ConfEntryScreen(),
        '/home_screen': (context) => const HomeScreen(),
      },
    );
  }
}
