import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_2/models/category.dart';
import 'package:meals_2/models/meal.dart';
import 'package:meals_2/providers/meals_provider.dart';
import 'package:meals_2/widgets/category_grid_item.dart';
import 'package:meals_2/providers/categories_provider.dart';

final selectedCategoryProvider = StateProvider<Category?>((ref) => null);

class CategorieScreen extends ConsumerWidget {
  const CategorieScreen({super.key, required this.availableMeals});

  final List<Meal> availableMeals;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categoriesAsyncValue = ref.watch(categoriesProvider);
    final mealsCount = ref.watch(mealCountProvider);

    return categoriesAsyncValue.when(
      data: (categories) => GridView(
        padding: const EdgeInsets.all(24),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: categories
            .map((category) => CategoryGridItem(
                  category: category,
                  selectCategory: () =>
                      selectCategory(context, ref, category, availableMeals),
                  mealCount: mealsCount[category.id] ?? 0,
                ))
            .toList(),
      ),
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (err, stack) => Center(child: Text('Error: $err')),
    );
  }
}
