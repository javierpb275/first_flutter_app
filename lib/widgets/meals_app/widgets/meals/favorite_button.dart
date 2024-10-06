import 'package:first_flutter_app/widgets/meals_app/models/meals/meal.dart';
import 'package:first_flutter_app/widgets/meals_app/providers/meals/favorites_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavoriteButton extends ConsumerWidget {
  const FavoriteButton({
    super.key,
    required this.meal,
  });

  final Meal meal;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return IconButton(
      onPressed: () {
        final wasAdded = ref
            .read(favoriteMealsProvider.notifier)
            .toggleMealFavoriteStatus(meal);

        ScaffoldMessenger.of(context).clearSnackBars();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              wasAdded
                  ? '${meal.title} was added to favorites'
                  : '${meal.title} was removed from favorites',
            ),
          ),
        );
      },
      icon: const Icon(Icons.star),
    );
  }
}
