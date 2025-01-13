import 'package:flutter/material.dart';
import 'package:meals_2/providers/filters_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:meals_2/models/meal.dart';
import 'package:meals_2/screens/filters.dart';
import 'package:meals_2/screens/meal_details.dart';

part 'navigation_notifier.g.dart';

/// Notifier for managing the selected page index state.
@riverpod
class SelectedPageIndexNotifier extends _$SelectedPageIndexNotifier {
  @override
  int build() {
    // Default page index is 0
    return 0;
  }

  /// Updates the selected page index state.
  void selectPage(int index) {
    state = index;
  }
}

/// Notifier for managing navigation logic.
@riverpod
class NavigationNotifier extends _$NavigationNotifier {
  @override
  void build() {
    // No initial state needed for this notifier
  }

  /// Sets the screen based on the identifier.
  /// Pops the current screen and navigates to the FiltersScreen if the identifier is 'filters'.
  Future<void> setScreen(BuildContext context, String identifier) async {
    Navigator.of(context).pop();
    if (identifier == 'filters') {
      await Navigator.of(context).push<Map<Filter, bool>>(
        MaterialPageRoute(
          builder: (ctx) => const FiltersScreen(),
        ),
      );
    }
  }

  void selectPage(int index) {
    ref.read(selectedPageIndexNotifierProvider.notifier).selectPage(index);
  }
}

/// Notifier for meal-related navigation logic.
@riverpod
class MealNavigationNotifier extends _$MealNavigationNotifier {
  @override
  void build() {
    // No initial state needed for this notifier
  }

  void selectMeal(BuildContext context, Meal meal) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MealDetailsScreen(
          meal: meal,
        ),
      ),
    );
  }
}
