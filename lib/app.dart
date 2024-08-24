import 'package:first_flutter_app/widgets/meals_app/meals_app.dart';
import 'package:first_flutter_app/widgets/meals_app/styles/theme/dark_theme_meals.dart';
import 'package:first_flutter_app/widgets/meals_app/styles/theme/light_theme_meals.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: DarkThemeMeals.theme,
      theme: LightThemeMeals.theme,
      themeMode: ThemeMode.light,
      home: const MealsApp(),
    );
  }
}
