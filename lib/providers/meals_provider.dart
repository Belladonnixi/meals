import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_2/data/data_repository.dart';
import 'package:meals_2/data/mock_database_repository.dart';
import 'package:meals_2/models/meal.dart';
import 'package:meals_2/providers/filters_provider.dart';

/// A provider that provides a list of meals asynchronously.
final mealsProvider = FutureProvider<List<Meal>>((ref) async {
  final DataRepository dataRepository = MockDatabaseRepository();
  return await dataRepository.getMeals();
});

final mealCountProvider = Provider<Map<String, int>>((ref) {
  final filteredMeals = ref.watch(filteredMealProvider);
  final mealCounts = <String, int>{};

  for (final meal in filteredMeals) {
    for (final categoryId in meal.categories) {
      mealCounts[categoryId] = (mealCounts[categoryId] ?? 0) + 1;
    }
  }

  return mealCounts;
});
