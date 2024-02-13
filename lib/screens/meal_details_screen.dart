import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:favorite_meals/models/meal.dart';
import 'package:favorite_meals/providers/favorite_meals_provider.dart';
import 'package:favorite_meals/widgets/meal_ingredients.dart';
import 'package:favorite_meals/widgets/meal_steps.dart';

class MealDetailsScreen extends ConsumerWidget {
  const MealDetailsScreen({
    super.key,
    required this.meal,
  });

  final Meal meal;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
            icon: const Icon(
              Icons.star,
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
