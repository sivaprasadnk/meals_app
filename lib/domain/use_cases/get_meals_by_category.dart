import 'package:meals_app/domain/entities/meal.dart';
import 'package:meals_app/domain/repository/meal_repository.dart';

class GetMealsByCategories {
  final MealRepository repository;

  GetMealsByCategories(this.repository);

  Future<List<Meal>> execute(String category) {
    return repository.getMealsByCategory(category);
  }
}
