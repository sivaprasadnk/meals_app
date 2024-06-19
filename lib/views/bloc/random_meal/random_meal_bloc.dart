import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meals_app/domain/entities/meal.dart';
import 'package:meals_app/domain/use_cases/get_random_meal.dart';

class MealEvent {}

class FetchRandomMealEvent extends MealEvent {}

class MealState {}

class MealLoadingState extends MealState {}

class MealLoadedState extends MealState {
  final Meal meal;

  MealLoadedState(this.meal);
}

class MealErrorState extends MealState {
  final String error;

  MealErrorState(this.error);
}

class RandomMealBloc extends Bloc<MealEvent, MealState> {
  final GetRandomMeal getRandomMeal;

  RandomMealBloc(this.getRandomMeal) : super(MealLoadingState()) {
    on<FetchRandomMealEvent>((event, emit) async {
      emit(MealLoadingState());
      try {
        final meal = await getRandomMeal.execute();
        emit(MealLoadedState(meal));
      } catch (error) {
        emit(MealErrorState(error.toString()));
      }
    });
  }
}
