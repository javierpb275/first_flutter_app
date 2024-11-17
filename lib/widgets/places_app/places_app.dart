import 'package:first_flutter_app/widgets/places_app/screens/places_screen.dart';
import 'package:first_flutter_app/widgets/places_app/themes/dark_theme.dart';
import 'package:first_flutter_app/widgets/places_app/themes/light_theme.dart';
import 'package:flutter/material.dart';

class PlacesApp extends StatefulWidget {
  const PlacesApp({super.key});

  @override
  State<PlacesApp> createState() {
    return _PlacesAppState();
  }
}

class _PlacesAppState extends State<PlacesApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Great Places',
      darkTheme: DarkTheme.theme,
      theme: LightTheme.theme,
      themeMode: ThemeMode.light,
      home: const PlacesScreen(),
    );
  }
}
