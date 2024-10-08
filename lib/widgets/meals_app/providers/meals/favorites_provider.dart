import 'dart:convert';
import 'package:first_flutter_app/widgets/meals_app/models/meals/meal.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Load favorite meals from SharedPreferences
final favoriteMealsLoaderProvider = FutureProvider<List<Meal>>((ref) async {
  final prefs = await SharedPreferences.getInstance();
  final favoriteMealsString = prefs.getString('favoriteMeals');

  if (favoriteMealsString != null) {
    final List<dynamic> decodedList = jsonDecode(favoriteMealsString);

    // Explicitly cast to List<Map<String, dynamic>> and map to List<Meal>
    final meals = decodedList
        .cast<Map<String, dynamic>>() // Cast each item to a Map
        .map((mealJson) => Meal.fromJson(mealJson))
        .toList();

    return meals; // Return List<Meal>
  }

  return []; // Return empty List<Meal> if no data
});

// StateNotifier to manage favorite meals after loading
class FavoriteMealsNotifier extends StateNotifier<List<Meal>> {
  FavoriteMealsNotifier(super.initialMeals);

  Future<void> _saveFavoriteMealsToPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    final List<Map<String, dynamic>> favoriteMealsJson =
        state.map((meal) => meal.toJson()).toList();
    prefs.setString('favoriteMeals', jsonEncode(favoriteMealsJson));
  }

  bool toggleMealFavoriteStatus(Meal meal) {
    final mealIsFavorite = state.contains(meal);

    if (mealIsFavorite) {
      state = state.where((m) => m.id != meal.id).toList();
    } else {
      state = [...state, meal];
    }

    _saveFavoriteMealsToPrefs();

    return !mealIsFavorite;
  }
}

// Provider for managing favorite meals
final favoriteMealsProvider =
    StateNotifierProvider<FavoriteMealsNotifier, List<Meal>>((ref) {
  final initialMeals = ref.watch(favoriteMealsLoaderProvider).maybeWhen(
        data: (meals) => meals, // This is already List<Meal>, no need for cast
        orElse: () => [],
      );
  return FavoriteMealsNotifier(
      initialMeals.cast()); // Ensure List<Meal> is passed
});
