// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_2/models/category.dart';
import 'package:meals_2/models/meal.dart';
import 'package:meals_2/providers/meals_provider.dart';
import 'package:meals_2/widgets/category_grid_item.dart';
import 'package:meals_2/providers/categories_provider.dart';

final selectedCategoryProvider = StateProvider<Category?>((ref) => null);

class CategorieScreen extends ConsumerStatefulWidget {
  const CategorieScreen({super.key, required this.availableMeals});

  final List<Meal> availableMeals;

  @override
  _CategorieScreenState createState() => _CategorieScreenState();
}

class _CategorieScreenState extends ConsumerState<CategorieScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
      lowerBound: 0,
      upperBound: 1,
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final categoriesAsyncValue = ref.watch(categoriesProvider);
    final mealsCount = ref.watch(mealCountProvider);

    return AnimatedBuilder(
      animation: _animationController,
      child: categoriesAsyncValue.when(
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
                    selectCategory: () => selectCategory(
                        context, ref, category, widget.availableMeals),
                    mealCount: mealsCount[category.id] ?? 0,
                  ))
              .toList(),
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('Error: $err')),
      ),
      builder: (context, child) => SlideTransition(
        position: Tween(
          begin: const Offset(0, 0.3),
          end: const Offset(0, 0),
        ).animate(
          CurvedAnimation(
            parent: _animationController,
            curve: Curves.easeInOut,
          ),
        ),
        child: child,
      ),
    );
  }
}
