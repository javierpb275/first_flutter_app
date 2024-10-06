import 'package:first_flutter_app/widgets/meals_app/data/meals/dummy_meals.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final mealsProvider = Provider((ref) {
  return dummyMeals;
});
