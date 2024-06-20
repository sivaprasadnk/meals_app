import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meals_app/domain/entities/meal.dart';
import 'package:meals_app/domain/use_cases/get_meals_by_category.dart';

class MealsByCategoryEvent {}

class FetchMealsByCategoryEvent extends MealsByCategoryEvent {}

class MealsByCategoryState {}

class MealsByCategoryLoadingState extends MealsByCategoryState {}

class MealsByCategoryLoadedState extends MealsByCategoryState {
  final List<Meal> meals;

  MealsByCategoryLoadedState(this.meals);
}

class MealsByCategoryErrorState extends MealsByCategoryState {
  final String error;

  MealsByCategoryErrorState(this.error);
}

class MealsByCategoryBloc
    extends Bloc<MealsByCategoryEvent, MealsByCategoryState> {
  final GetMealsByCategory getMealsByCategory;

  MealsByCategoryBloc(this.getMealsByCategory)
      : super(MealsByCategoryLoadingState()) {
    on<FetchMealsByCategoryEvent>((event, emit) async {
      emit(MealsByCategoryLoadingState());
      try {
        // final meal = await getMealsByCategory.execute(state.);
        // emit(MealsByCategoryLoadedState(meal));
      } catch (error) {
        emit(MealsByCategoryErrorState(error.toString()));
      }
    });
  }
}
