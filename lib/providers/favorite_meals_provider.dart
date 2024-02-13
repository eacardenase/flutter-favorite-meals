import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:favorite_meals/models/meal.dart';

class FavoriteMealsNotifier extends StateNotifier<List<Meal>> {
  FavoriteMealsNotifier() : super([]);

  bool toggleMealFavoritesStatus(Meal meal) {
    final mealIsFavorite = state.contains(meal);

    if (mealIsFavorite) {
      state = state.where((currentMeal) => currentMeal.id != meal.id).toList();

      return false;
    }

    state = [
      ...state,
      meal,
    ];

    return true;
  }
}

final favoriteMealsProvider =
    StateNotifierProvider<FavoriteMealsNotifier, List<Meal>>(
  (ref) => FavoriteMealsNotifier(),
);
