import 'package:flutter/material.dart';

abstract class ThemeApp {
  static final ThemeData themeData = ThemeData().copyWith(
      primaryColor: const Color(0XFFffa500),
      appBarTheme: const AppBarTheme()
          .copyWith(backgroundColor: const Color(0XFFffa500)));
}
