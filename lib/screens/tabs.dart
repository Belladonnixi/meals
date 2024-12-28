import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_2/providers/filters_provider.dart';
import 'package:meals_2/providers/navigation_notifier.dart';
import 'package:meals_2/providers/favorites_provider.dart';
import 'package:meals_2/screens/categories.dart';
import 'package:meals_2/screens/meals.dart';
import 'package:meals_2/widgets/bottom_nav_bar.dart';
import 'package:meals_2/widgets/main_drawer.dart';

class TabsScreen extends ConsumerWidget {
  const TabsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedPageIndex = ref.watch(selectedPageIndexProvider);
    final navigationNotifier = ref.read(navigationProvider);

    Widget activePage;
    var activePageTitle = 'Categories';

    if (selectedPageIndex == 0) {
      final availableMeals = ref.watch(filteredMealProvider);

      activePage = CategorieScreen(
        availableMeals: availableMeals,
      );
    } else {
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
      bottomNavigationBar: BottomNavBar(
        currentIndex: selectedPageIndex,
        onTap: (index) => navigationNotifier.selectPage(index),
      ),
    );
  }
}
