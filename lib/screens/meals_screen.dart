import 'package:flutter/material.dart';

import 'package:favorite_meals/models/category.dart';
import 'package:favorite_meals/models/meal.dart';
import 'package:favorite_meals/widgets/meal_item.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({
    super.key,
    required this.category,
    required this.meals,
  });

  final Category category;
  final List<Meal> meals;

  @override
  Widget build(BuildContext context) {
    Widget mainContent = Center(
      child: Column(
        // mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Uh oh... nothing here!",
            style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
          ),
          const SizedBox(height: 16),
          Text(
            'Try selecting a different category!',
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
          )
        ],
      ),
    );

    if (meals.isNotEmpty) {
      mainContent = ListView.builder(
        itemCount: meals.length,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          final meal = meals[index];

          return MealItem(
            meal: meal,
          );
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          category.title,
        ),
      ),
      body: mainContent,
    );
  }
}
