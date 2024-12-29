import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_2/models/meal.dart';
import 'package:meals_2/providers/navigation_notifier.dart';
import 'package:meals_2/widgets/meal_item.dart';

/// The screen that displays a list of meals.
class MealsScreen extends ConsumerWidget {
  const MealsScreen({
    super.key,
    this.title,
    required this.meals,
  });

  final String? title;
  final List<Meal> meals;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mealNavigationNotifier = ref.read(mealNavigationProvider);

    Widget content = Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Uh oh ... nothing here!',
            style: Theme.of(context)
                .textTheme
                .headlineLarge!
                .copyWith(color: Theme.of(context).colorScheme.onSurface),
          ),
          const SizedBox(height: 16),
          Text(
            'Try selecting a different category!',
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: Theme.of(context).colorScheme.onSurface),
          ),
        ],
      ),
    );

    if (meals.isNotEmpty) {
      content = ListView.builder(
        itemCount: meals.length,
        itemBuilder: (ctx, index) => MealItem(
          meal: meals[index],
          onSelectMeal: (meal) =>
              mealNavigationNotifier.selectMeal(context, meal),
        ),
      );
    }

    if (title == null) {
      return content;
    }

    return Scaffold(
      appBar: AppBar(title: Text(title!)),
      body: content,
    );
  }
}
