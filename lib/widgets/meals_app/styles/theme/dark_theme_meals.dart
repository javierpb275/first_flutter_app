import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DarkThemeMeals {
  static ThemeData get theme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        brightness: Brightness.dark,
        seedColor: const Color.fromARGB(255, 208, 55, 132),
      ),
      textTheme: GoogleFonts.latoTextTheme(),
    );
  }
}
