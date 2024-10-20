import 'package:flutter/material.dart';

class DarkThemeShop {
  static ThemeData get theme {
    return ThemeData.dark().copyWith(
      colorScheme: ColorScheme.fromSeed(
        seedColor: const Color.fromARGB(255, 147, 229, 250),
        brightness: Brightness.dark,
        surface: const Color.fromARGB(255, 42, 51, 59),
      ),
      scaffoldBackgroundColor: const Color.fromARGB(255, 50, 58, 60),
    );
  }
}
