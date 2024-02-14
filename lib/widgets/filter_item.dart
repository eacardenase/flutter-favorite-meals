import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:favorite_meals/providers/filters_provider.dart';

class FilterItem extends ConsumerWidget {
  const FilterItem({
    super.key,
    required this.title,
    required this.description,
    required this.filter,
  });

  final String title;
  final String description;
  final Filter filter;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeFilters = ref.watch(filtersProvider);

    return SwitchListTile(
      value: activeFilters[filter]!,
      onChanged: (newValue) {
        ref.read(filtersProvider.notifier).setFilter(
              filter,
              newValue,
            );
      },
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Theme.of(context).colorScheme.onBackground,
            ),
      ),
      subtitle: Text(
        description,
        style: Theme.of(context).textTheme.labelMedium!.copyWith(
              color: Theme.of(context).colorScheme.onBackground,
            ),
      ),
      activeColor: Theme.of(context).colorScheme.tertiary,
      contentPadding: const EdgeInsets.only(left: 34, right: 22),
    );
  }
}
