import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:favorite_meals/models/meal.dart';
import 'package:favorite_meals/providers/favorite_meals_provider.dart';
import 'package:favorite_meals/widgets/meal_ingredients.dart';
import 'package:favorite_meals/widgets/meal_steps.dart';

// ConsumerWidget needs a ref parameter on build method
// ConsumerStatefulWidget already provides it globally
class MealDetailsScreen extends ConsumerWidget {
  const MealDetailsScreen({
    super.key,
    required this.meal,
  });

  final Meal meal;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoriteMeals = ref.watch(favoriteMealsProvider);
    final isFavorite = favoriteMeals.contains(meal);

    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              final wasAdded = ref
                  .read(favoriteMealsProvider.notifier)
                  .toggleMealFavoritesStatus(meal);

              ScaffoldMessenger.of(context).clearSnackBars();

              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  duration: const Duration(seconds: 3),
                  content: Text(
                    wasAdded
                        ? 'Meal added to favorites.'
                        : 'Meal removed from favorites.',
                  ),
                ),
              );
            },
            icon: AnimatedSwitcher(
              duration: const Duration(milliseconds: 150),
              transitionBuilder: (child, animation) => RotationTransition(
                turns: Tween<double>(
                  begin: 0.65,
                  end: 1.0,
                ).animate(animation),
                child: child,
              ),
              child: Icon(
                isFavorite ? Icons.star : Icons.star_border,
                key: ValueKey(isFavorite),
              ),
            ),
          )
        ],
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          Image.network(
            meal.imageUrl,
            height: 300,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 10),
          MealIngredients(ingredients: meal.ingredients),
          const SizedBox(height: 24),
          MealSteps(steps: meal.steps)
        ],
      ),
    );
  }
}
