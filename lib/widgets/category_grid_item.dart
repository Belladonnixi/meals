import 'package:flutter/material.dart';
import 'package:meals_2/models/category.dart';

class CategoryGridItem extends StatelessWidget {
  const CategoryGridItem(
      {super.key,
      required this.category,
      required this.selectCategory,
      required this.mealCount});

  final Category category;
  final void Function() selectCategory;
  final int mealCount;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: selectCategory,
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            colors: [
              category.color.withAlpha((0.55 * 255).toInt()),
              category.color.withAlpha((0.9 * 255).toInt()),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              child: Text(
                category.title,
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
              ),
            ),
            const Spacer(),
            Align(
              alignment: Alignment.bottomRight,
              child: Text(
                '$mealCount',
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
