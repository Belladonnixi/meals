import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_2/models/meal.dart';
import 'package:meals_2/screens/meal_details.dart';

final mealNavigationProvider = Provider((ref) {
  return MealNavigationNotifier();
});

class MealNavigationNotifier {
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
