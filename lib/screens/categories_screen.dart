import 'package:flutter/material.dart';

import 'package:favorite_meals/data/dummy_data.dart';
import 'package:favorite_meals/models/category.dart';
import 'package:favorite_meals/screens/meals_screen.dart';
import 'package:favorite_meals/widgets/category_grid_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  void _selectCategory(BuildContext context, Category category) {
    final filteredMeals = dummyMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => MealsScreen(
          category: category,
          meals: filteredMeals,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pick your category'),
        centerTitle: true,
      ),
      body: GridView(
        padding: const EdgeInsets.all(20),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // how many columns
          childAspectRatio: 3 / 2, // size of each grid element
          crossAxisSpacing: 20, // spacing between the columns
          mainAxisSpacing: 20, // spacing between the rows
        ),
        children: [
          for (final category in availableCategories)
            CategoryGridItem(
              category: category,
              onSelectCategory: _selectCategory,
            )
        ],
      ),
    );
  }
}
