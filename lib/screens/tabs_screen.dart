import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:favorite_meals/models/meal.dart';
import 'package:favorite_meals/screens/categories_screen.dart';
import 'package:favorite_meals/screens/filters_screen.dart';
import 'package:favorite_meals/screens/meals_screen.dart';
import 'package:favorite_meals/widgets/main_drawer.dart';
import 'package:favorite_meals/providers/meals_provider.dart';

enum ScreenIdentifier { meals, filters }

const initialFilters = {
  Filter.glutenFree: false,
  Filter.lactoseFree: false,
  Filter.vegetarian: false,
  Filter.vegan: false,
};

class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});

  @override
  ConsumerState<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends ConsumerState<TabsScreen> {
  int _selectedPageIndex = 0;
  final List<Meal> _favoriteMeals = [];
  Map<Filter, bool> _selectedFilters = initialFilters;

  void _showInfoMessage(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 3),
        content: Text(
          message,
        ),
      ),
    );
  }

  void _toggleFavoriteMealStatus(Meal meal) {
    final isExisting = _favoriteMeals.contains(meal);

    if (isExisting) {
      setState(() {
        _favoriteMeals.remove(meal);
      });

      _showInfoMessage('Meal removed from favorites.');
    } else {
      setState(() {
        _favoriteMeals.add(meal);
      });

      _showInfoMessage('Meal added to favorites.');
    }
  }

  void _selectedPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  void _setScreen(ScreenIdentifier identifier) async {
    Navigator.of(context).pop();

    if (identifier == ScreenIdentifier.filters) {
      final result = await Navigator.of(context).push<Map<Filter, bool>>(
        MaterialPageRoute(
          builder: (context) => FiltersScreen(
            currentFilters: _selectedFilters,
          ),
        ),
      );

      setState(() {
        _selectedFilters = result ?? initialFilters;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final meals = ref.watch(mealsProvider);

    final availableMeals = meals.where((meal) {
      if (_selectedFilters[Filter.glutenFree]! && !meal.isGlutenFree) {
        return false;
      }

      if (_selectedFilters[Filter.lactoseFree]! && !meal.isLactoseFree) {
        return false;
      }

      if (_selectedFilters[Filter.vegetarian]! && !meal.isVegetarian) {
        return false;
      }

      if (_selectedFilters[Filter.vegan]! && !meal.isVegan) {
        return false;
      }

      return true;
    }).toList();

    Widget activePage = CategoriesScreen(
      availableMeals: availableMeals,
      onToggleFavoriteMeal: _toggleFavoriteMealStatus,
    );
    var screenTitle = 'Categories';

    if (_selectedPageIndex == 1) {
      activePage = MealsScreen(
        meals: _favoriteMeals,
        onToggleFavoriteMeal: _toggleFavoriteMealStatus,
      );
      screenTitle = 'Your Favorites';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(screenTitle),
        centerTitle: true,
      ),
      drawer: MainDrawer(
        onSelectScreen: _setScreen,
      ),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectedPage,
        currentIndex: _selectedPageIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.dining_outlined),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favorites',
          ),
        ],
      ),
    );
  }
}
