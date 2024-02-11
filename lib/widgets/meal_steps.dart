import 'package:flutter/material.dart';

class MealSteps extends StatelessWidget {
  const MealSteps({
    super.key,
    required this.steps,
  });

  final List<String> steps;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Steps',
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.primary,
              ),
        ),
        const SizedBox(height: 14),
        for (final step in steps)
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 30, bottom: 6),
            child: Text(
              step,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
          )
      ],
    );
  }
}
