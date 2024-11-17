import 'package:flutter/material.dart';

class DrivadoTheme {
  DrivadoTheme._instance();

  static final _singleton = DrivadoTheme._instance();

  factory DrivadoTheme() => _singleton;
  static const primary = Color(0xfffb4156);
  static const secondaryColor = Color(0xfffb4156);
  static const appbarBackground = Color(0xff190c0c);
  static const appbarForegroundColor = Colors.white;
  static const appbarTextSize = 20.00;
}
