import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_2/data/dummy_data.dart';

/// A provider that provides a list of dummy meals.
final mealsProvider = Provider((ref) {
  return dummyMeals;
});
