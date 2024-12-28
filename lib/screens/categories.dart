import 'package:flutter/material.dart';
import 'package:meals_2/data/dummy_data.dart';
import 'package:meals_2/models/category.dart';
import 'package:meals_2/models/meal.dart';
import 'package:meals_2/screens/meals.dart';
import 'package:meals_2/widgets/category_grid_item.dart';

class CategorieScreen extends StatelessWidget {
  const CategorieScreen({super.key, required this.availableMeals});

  final List<Meal> availableMeals;

  void _selectCategory(BuildContext context, Category category) {
    final filteredMeals = availableMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MealsScreen(
          title: category.title,
          meals: filteredMeals,
        ),
      ),
    ); // Navigator.push(context, route)
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(24),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      children: availableCategories
          .map((category) => CategoryGridItem(
                category: category,
                selectCategory: () => _selectCategory(context, category),
              ))
          .toList(),
      /* 
        alternative to the above code:
        for (final category in availableCategories)
          CategoryGridItem(category: category),
         */
    );
  }
}