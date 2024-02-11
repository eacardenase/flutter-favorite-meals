import 'package:flutter/material.dart';

import 'package:favorite_meals/models/meal.dart';
import 'package:favorite_meals/widgets/meal_ingredients.dart';
import 'package:favorite_meals/widgets/meal_steps.dart';

class MealDetailsScreen extends StatelessWidget {
  const MealDetailsScreen({
    super.key,
    required this.meal,
    required this.onToggleFavoriteMeal,
  });

  final Meal meal;
  final void Function(Meal) onToggleFavoriteMeal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              onToggleFavoriteMeal(meal);
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
