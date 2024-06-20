import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meals_app/domain/entities/meal.dart';
import 'package:meals_app/domain/use_cases/get_meals_by_category.dart';

// Define the events
abstract class MealsByCategoryEvent extends Equatable {
  const MealsByCategoryEvent();

  @override
  List<Object> get props => [];
}

class FetchMealsByCategory extends MealsByCategoryEvent {
  final String category;

  const FetchMealsByCategory(this.category);

  @override
  List<Object> get props => [category];
}

// Define the states
abstract class MealsByCategoryState extends Equatable {
  const MealsByCategoryState();

  @override
  List<Object> get props => [];
}

class MealsByCategoryInitial extends MealsByCategoryState {}

class MealsByCategoryLoading extends MealsByCategoryState {}

class MealsByCategoryLoaded extends MealsByCategoryState {
  final List<Meal> meals;

  const MealsByCategoryLoaded(this.meals);

  @override
  List<Object> get props => [meals];
}

class MealsByCategoryError extends MealsByCategoryState {
  final String message;

  const MealsByCategoryError(this.message);

  @override
  List<Object> get props => [message];
}

// Define the Bloc
class MealsByCategoryBloc
    extends Bloc<MealsByCategoryEvent, MealsByCategoryState> {
  final GetMealsByCategory getMealsByCategory;
  MealsByCategoryBloc(this.getMealsByCategory)
      : super(MealsByCategoryInitial()) {
    on<FetchMealsByCategory>(_onFetchMealsByCategory);
  }

  Future<void> _onFetchMealsByCategory(
      FetchMealsByCategory event, Emitter<MealsByCategoryState> emit) async {
    emit(MealsByCategoryLoading());
    try {
      // Replace with your logic to fetch meals by category
      final List<Meal> meals = await getMealsByCategory.execute(event.category);
      emit(MealsByCategoryLoaded(meals));
    } catch (e) {
      emit(MealsByCategoryError(e.toString()));
    }
  }

  Future<List<String>> fetchMealsByCategory(String category) async {
    // Simulate a network call
    await Future.delayed(const Duration(seconds: 2));
    return ['Meal 1', 'Meal 2', 'Meal 3']; // Replace with actual data
  }
}


// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:meals_app/domain/entities/meal.dart';
// import 'package:meals_app/domain/use_cases/get_meals_by_category.dart';

// class MealsByCategoryEvent {}

// class FetchMealsByCategoryEvent extends MealsByCategoryEvent {
//   final String category;
//   FetchMealsByCategoryEvent(this.category);
// }

// class MealsByCategoryState {}

// class MealsByCategoryLoadingState extends MealsByCategoryState {}

// class MealsByCategoryLoadedState extends MealsByCategoryState {
//   final List<Meal> meals;

//   MealsByCategoryLoadedState(this.meals);
// }

// class MealsByCategoryErrorState extends MealsByCategoryState {
//   final String error;

//   MealsByCategoryErrorState(this.error);
// }

// class MealsByCategoryBloc
//     extends Bloc<MealsByCategoryEvent, MealsByCategoryState> {
//   final GetMealsByCategory getMealsByCategory;

//   MealsByCategoryBloc(this.getMealsByCategory)
//       : super(MealsByCategoryState()) {
//     on<FetchMealsByCategoryEvent>((event, emit) async {
//       emit(MealsByCategoryLoadingState());
//       try {
//         final mealsList = await getMealsByCategory.execute(event.category);
//         emit(MealsByCategoryLoadedState(mealsList));
//       } catch (error) {
//         emit(MealsByCategoryErrorState(error.toString()));
//       }
//     });
//   }
// }
