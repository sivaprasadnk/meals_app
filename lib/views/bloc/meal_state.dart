import 'package:meals_app/domain/entities/meal.dart';

abstract class MealState {}

class MealInitial extends MealState {}

class MealLoading extends MealState {}

class MealLoaded extends MealState {
  final Meal meal;

  MealLoaded(this.meal);
}
