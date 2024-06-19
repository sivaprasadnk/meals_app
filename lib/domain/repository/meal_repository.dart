import 'package:meals_app/domain/entities/meal.dart';
import 'package:meals_app/domain/entities/meal_category.dart';

abstract class MealRepository {
  Future<Meal> getRandomMeal();
  Future<List<MealCategory>> getMealCategories();
  Future<List<Meal>> getMealsByCategory(String catrgory);

}
