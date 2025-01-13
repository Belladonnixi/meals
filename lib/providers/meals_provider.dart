import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_2/data/mock_database_repository.dart';
import 'package:meals_2/models/meal.dart';
import 'package:meals_2/providers/filters_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'meals_provider.g.dart';

@riverpod
Future<List<Meal>> meals(Ref ref) async {
  final dataRepository = MockDatabaseRepository();
  return await dataRepository.getMeals();
}

@riverpod
Map<String, int> mealCount(Ref ref) {
  final filteredMeals = ref.watch(filteredMealProvider);
  final mealCounts = <String, int>{};

  for (final meal in filteredMeals) {
    for (final categoryId in meal.categories) {
      mealCounts[categoryId] = (mealCounts[categoryId] ?? 0) + 1;
    }
  }

  return mealCounts;
}
