import 'package:meals_app/domain/entities/meal_category.dart';
import 'package:meals_app/domain/repository/meal_repository.dart';

class GetMealCategries {
  final MealRepository repository;

  GetMealCategries(this.repository);

  Future<List<MealCategory>> execute() {
    return repository.getMealCategories();
  }
}
