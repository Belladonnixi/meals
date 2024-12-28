import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_2/data/mock_database_repository.dart';
import 'package:meals_2/models/category.dart';
import 'package:meals_2/models/meal.dart';
import 'package:meals_2/screens/meals.dart';

/// A provider that fetches a list of categories asynchronously.
final categoriesProvider = FutureProvider<List<Category>>((ref) async {
  final dataRepository = MockDatabaseRepository();
  return await dataRepository.getCategories();
});

// A provider that holds the currently selected category.
final selectedCategoryProvider = StateProvider<Category?>((ref) => null);

// Selects a category and navigates to the meals screen.
//
// This function takes in the [BuildContext], [WidgetRef], [Category], and [availableMeals].
// It filters the [availableMeals] based on the selected [category], updates the selected category state,
// and navigates to the [MealsScreen] with the filtered meals.
void selectCategory(BuildContext context, WidgetRef ref, Category category,
    List<Meal> availableMeals) {
  final filteredMeals = availableMeals
      .where((meal) => meal.categories.contains(category.id))
      .toList();

  ref.read(selectedCategoryProvider.notifier).state = category;

  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (ctx) => MealsScreen(
        title: category.title,
        meals: filteredMeals,
      ),
    ),
  );
}
