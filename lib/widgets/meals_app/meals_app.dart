import 'package:first_flutter_app/widgets/meals_app/data/meals/dummy_meals.dart';
import 'package:first_flutter_app/widgets/meals_app/screens/meals/meals_screen.dart';
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
    return const MealsScreen(
      title: 'TEST',
      meals: dummyMeals,
    );
  }
}
