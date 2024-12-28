import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_2/models/meal.dart';
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

final filteredMealProvider = Provider<List<Meal>>((ref) {
  final mealsAsyncValue = ref.watch(mealsProvider);
  final activeFilters = ref.watch(filtersProvider);

  /// Filters the list of meals based on the active filters.
  ///
  /// Takes a list of meals and filters it based on the active filters.
  /// The active filters are stored in the `activeFilters` map, where the key is
  /// the filter type and the value is a boolean indicating whether the filter is active.
  /// Returns a new list of meals that pass the active filters.

  return mealsAsyncValue.when(
    data: (meals) {
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
    },
    loading: () => [],
    error: (err, stack) => [],
  );
});
