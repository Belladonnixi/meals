import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_2/data/mock_database_repository.dart';
import 'package:meals_2/models/category.dart';
import 'package:meals_2/models/meal.dart';
import 'package:meals_2/screens/meals.dart';

final categoriesProvider = FutureProvider<List<Category>>((ref) async {
  final dataRepository = MockDatabaseRepository();
  return await dataRepository.getCategories();
});

final selectedCategoryProvider = StateProvider<Category?>((ref) => null);

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
