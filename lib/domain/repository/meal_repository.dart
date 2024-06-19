import 'package:meals_app/domain/entities/meal.dart';

abstract class MealRepository {
  Future<Meal> getRandomMeal();
}
