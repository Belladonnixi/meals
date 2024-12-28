import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_2/models/meal.dart';

/// A [StateNotifier] that manages a list of favorite meals.
class FavoriteMealsNotifier extends StateNotifier<List<Meal>> {
  FavoriteMealsNotifier() : super([]);

  /// Toggles the favorite status of a meal.
  ///
  /// If [mealIsFavorite] is `true`, the [meal] is removed from the [state] list.
  /// If [mealIsFavorite] is `false`, the [meal] is added to the [state] list.
  ///
  /// Returns `true` if the meal is added to favorites, `false` if it is removed.
  bool toggleMealFavorite(Meal meal) {
    final mealIsFavorite = state.contains(meal);

    if (mealIsFavorite) {
      state = state.where((m) => m.id != meal.id).toList();
      return false;
    } else {
      state = [...state, meal];
      return true;
    }
  }
}

/// A [StateNotifierProvider] for [FavoriteMealsNotifier].
final favoriteMealsProvider =
    StateNotifierProvider<FavoriteMealsNotifier, List<Meal>>((ref) {
  return FavoriteMealsNotifier();
});
