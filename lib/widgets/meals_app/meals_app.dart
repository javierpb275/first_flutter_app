import 'package:first_flutter_app/widgets/meals_app/screens/tabs/tabs_screen.dart';
import 'package:flutter/material.dart';

class MealsApp extends StatefulWidget {
  const MealsApp({super.key});

  @override
  State<MealsApp> createState() {
    return _MealsAppState();
  }
}

class _MealsAppState extends State<MealsApp> {
  @override
  Widget build(BuildContext context) {
    return const TabsScreen();
  }
}
