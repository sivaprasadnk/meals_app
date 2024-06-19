import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meals_app/domain/entities/meal_category.dart';
import 'package:meals_app/domain/use_cases/get_meal_category.dart';

class MealCategoryEvent {}

class FetchMealCategoriesEvent extends MealCategoryEvent {}

class MealCategoryState {}

class MealCategoryLoadingState extends MealCategoryState {}

class MealCategoryLoadedState extends MealCategoryState {
  final List<MealCategory> categories;

  MealCategoryLoadedState(this.categories);
}

class MealCategoryErrorState extends MealCategoryState {
  final String error;

  MealCategoryErrorState(this.error);
}

class MealCategoryBloc extends Bloc<MealCategoryEvent, MealCategoryState> {
  // final MealRepository mealRepository;
  final GetMealCategories getMealCategories;

  MealCategoryBloc(this.getMealCategories) : super(MealCategoryLoadingState()) {
    on<FetchMealCategoriesEvent>((event, emit) async {
      emit(MealCategoryLoadingState());
      try {
        final categories = await getMealCategories.execute();
        emit(MealCategoryLoadedState(categories));
      } catch (error) {
        emit(MealCategoryErrorState(error.toString()));
      }
    });
  }
}
