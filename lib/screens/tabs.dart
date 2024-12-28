import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_2/providers/favorites_provider.dart';
import 'package:meals_2/providers/filters_provider.dart';
import 'package:meals_2/providers/navigation_notifier.dart';
import 'package:meals_2/screens/categories.dart';
import 'package:meals_2/screens/meals.dart';
import 'package:meals_2/widgets/main_drawer.dart';

/// The main screen that displays tabs for different sections of the app.
class TabsScreen extends ConsumerWidget {
  const TabsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final availableMeals = ref.watch(filteredMealProvider);
    final selectedPageIndex = ref.watch(selectedPageIndexProvider);
    final navigationNotifier = ref.read(navigationProvider);

    Widget activePage = CategorieScreen(
      availableMeals: availableMeals,
    );
    var activePageTitle = 'Categories';

    if (selectedPageIndex == 1) {
      final favoriteMeals = ref.watch(favoriteMealsProvider);

      activePage = MealsScreen(
        meals: favoriteMeals,
      );
      activePageTitle = 'Your Favorites';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      drawer: MainDrawer(
        onSelectScreen: (identifier) =>
            navigationNotifier.setScreen(context, identifier),
      ),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) => navigationNotifier.selectPage(index),
        currentIndex: selectedPageIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.set_meal),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favorites',
          ),
        ],
      ),
    );
  }
}
