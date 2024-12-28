import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_2/screens/filters.dart';
import 'package:meals_2/providers/filters_provider.dart';

/// Provider for managing the selected page index state.
final selectedPageIndexProvider = StateProvider<int>((ref) => 0);

/// Provider for the NavigationNotifier.
final navigationProvider = Provider<NavigationNotifier>((ref) {
  return NavigationNotifier(ref);
});

/// Notifier class for handling navigation logic.
class NavigationNotifier {
  /// A reference to an object.
  ///
  /// This is used in the `NavigationNotifier` class to store a reference to an object.
  /// It is typically used to keep track of the current navigation state in a Flutter application.
  final Ref ref;

  NavigationNotifier(this.ref);

  /// Selects the page by updating the selected page index state.
  void selectPage(int index) {
    ref.read(selectedPageIndexProvider.notifier).state = index;
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
}
