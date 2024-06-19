import 'package:meals_app/views/bloc/meal_state.dart';

class MealError extends MealState {
  final String message;

  MealError(this.message);
}
