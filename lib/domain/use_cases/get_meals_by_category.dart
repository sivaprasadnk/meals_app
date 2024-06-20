import 'package:meals_app/domain/entities/meal.dart';
import 'package:meals_app/domain/repository/meal_repository.dart';

class GetMealsByCategory {
  final MealRepository repository;

  GetMealsByCategory(this.repository);

  Future<List<Meal>> execute(String category) {
    return repository.getMealsByCategory(category);
  }
}
