import 'package:flutter/material.dart';

class MealIngredients extends StatelessWidget {
  const MealIngredients({
    super.key,
    required this.ingredients,
  });

  final List<String> ingredients;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Ingredients',
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 14),
        for (final ingredient in ingredients)
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 30, bottom: 6),
            child: Text(
              ingredient,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
          ),
      ],
    );
  }
}
