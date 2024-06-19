import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meals_app/domain/use_cases/get_random_meal.dart';
import 'package:meals_app/views/bloc/meal_error.dart';
import 'package:meals_app/views/bloc/meal_event.dart';
import 'package:meals_app/views/bloc/meal_state.dart';

class MealBloc extends Bloc<MealEvent, MealState> {
  final GetRandomMeal getRandomMeal;

  MealBloc(this.getRandomMeal) : super(MealInitial()) {
    on<GetMealEvent>((event, emit) async {
      emit(MealLoading());
      try {
        final meal = await getRandomMeal.execute();
        emit(MealLoaded(meal));
      } catch (e) {
        emit(MealError(e.toString()));
      }
    });
  }
}
