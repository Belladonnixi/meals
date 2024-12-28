import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_2/data/data_repository.dart';
import 'package:meals_2/data/mock_database_repository.dart';
import 'package:meals_2/models/meal.dart';

/// A provider that provides a list of meals asynchronously.
final mealsProvider = FutureProvider<List<Meal>>((ref) async {
  final DataRepository dataRepository = MockDatabaseRepository();
  return await dataRepository.getMeals();
});
