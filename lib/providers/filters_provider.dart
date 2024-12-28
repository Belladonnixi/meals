import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_2/providers/meals_provider.dart';

/// Represents the available filters for meals.
enum Filter {
  glutenFree,
  lactoseFree,
  vegetarian,
  vegan,
}

/// Notifier class for managing filters.
class FiltersNotifier extends StateNotifier<Map<Filter, bool>> {
  FiltersNotifier()
      : super({
          Filter.glutenFree: false,
          Filter.lactoseFree: false,
          Filter.vegetarian: false,
          Filter.vegan: false,
        });

  /// Sets the value of a specific filter.
  void setFilter(Filter filter, bool isActive) {
    state = {
      ...state,
      filter: isActive,
    };
  }

  /// Sets multiple filters at once.
  void setFilters(Map<Filter, bool> chosenFilters) {
    state = chosenFilters;
  }
}

/// Provider for managing filters.
final filtersProvider =
    StateNotifierProvider<FiltersNotifier, Map<Filter, bool>>(
  (ref) => FiltersNotifier(),
);

final filteredMealProvider = Provider((ref) {
  final meals = ref.watch(mealsProvider);
  final activeFilters = ref.watch(filtersProvider);

  return meals.where((meal) {
    if (activeFilters[Filter.glutenFree]! && !meal.isGlutenFree) {
      return false;
    }
    if (activeFilters[Filter.lactoseFree]! && !meal.isLactoseFree) {
      return false;
    }
    if (activeFilters[Filter.vegetarian]! && !meal.isVegetarian) {
      return false;
    }
    if (activeFilters[Filter.vegan]! && !meal.isVegan) {
      return false;
    }
    return true;
  }).toList();
});
