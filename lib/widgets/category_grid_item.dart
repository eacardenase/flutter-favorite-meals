import 'package:flutter/material.dart';

import 'package:favorite_meals/models/category.dart';

class CategoryGridItem extends StatelessWidget {
  const CategoryGridItem(
      {super.key, required this.category, required this.onSelectCategory});

  final Category category;
  final void Function(BuildContext, Category) onSelectCategory;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onSelectCategory(context, category),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(8), // inkwell's border
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8), // container's border
          gradient: LinearGradient(
            colors: [
              category.color.withOpacity(0.45),
              category.color.withOpacity(0.9),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Text(
            category.title,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
          ),
        ),
      ),
    );
  }
}
