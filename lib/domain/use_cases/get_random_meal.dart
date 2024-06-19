import 'package:meals_app/domain/entities/meal.dart';
import 'package:meals_app/domain/repository/meal_repository.dart';

class GetRandomMeal {
  final MealRepository repository;

  GetRandomMeal(this.repository);

  Future<Meal> execute() {
    return repository.getRandomMeal();
  }
}
