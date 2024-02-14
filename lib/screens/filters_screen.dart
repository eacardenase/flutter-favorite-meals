import 'package:flutter/material.dart';

import 'package:favorite_meals/providers/filters_provider.dart';
import 'package:favorite_meals/widgets/filter_item.dart';

class FiltersScreen extends StatelessWidget {
  const FiltersScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Your Filters'),
      ),
      body: const Column(
        children: [
          FilterItem(
            title: 'Gluten-Free',
            description: 'Only include gluten-free meals.',
            filter: Filter.glutenFree,
          ),
          FilterItem(
            title: 'Lactose-Free',
            description: 'Only include lactose-free meals.',
            filter: Filter.lactoseFree,
          ),
          FilterItem(
            title: 'Vegetarian',
            description: 'Only include vegetarian meals.',
            filter: Filter.vegetarian,
          ),
          FilterItem(
            title: 'Vegan',
            description: 'Only include vegan meals.',
            filter: Filter.vegan,
          ),
        ],
      ),
    );
  }
}
