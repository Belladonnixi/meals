import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_2/models/meal.dart';

class FavoriteMealsNotifier extends StateNotifier<List<Meal>> {
  FavoriteMealsNotifier() : super([]);

  bool toggleMealFavorite(Meal meal) {
    final mealIsFavorite = state.contains(meal);

    /// Toggles the favorite status of a meal.
    ///
    /// If [mealIsFavorite] is `true`, the [meal] is removed from the [state] list.
    /// If [mealIsFavorite] is `false`, the [meal] is added to the [state] list.
    bool toggleFavorite(Meal meal) {
      if (mealIsFavorite) {
        state = state.where((m) => m.id != meal.id).toList();
        return false;
      } else {
        state = [...state, meal];
        return true;
      }
    }

    return toggleFavorite(meal);
  }
}

final favoriteMealsProvider =
    StateNotifierProvider<FavoriteMealsNotifier, List<Meal>>((ref) {
  return FavoriteMealsNotifier();
});
