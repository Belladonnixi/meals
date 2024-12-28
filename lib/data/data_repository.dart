import 'package:meals_2/models/category.dart';
import 'package:meals_2/models/meal.dart';

abstract class DataRepository {
  Future<List<Meal>> getMeals();
  Future<List<Category>> getCategories();
}
