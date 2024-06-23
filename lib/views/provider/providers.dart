// presentation/providers/meal_providers.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:meals_app/data/data_sources/meal_remote_data_source.dart';
import 'package:meals_app/data/repository/meal_repository_impl.dart';
import 'package:meals_app/domain/entities/meal.dart';
import 'package:meals_app/domain/entities/meal_category.dart';
import 'package:meals_app/domain/use_cases/get_meal_category.dart';
import 'package:meals_app/domain/use_cases/get_random_meal.dart';

// Data source provider
final mealRemoteDataSourceProvider = Provider<MealRemoteDataSource>((ref) {
  return MealRemoteDataSource(http.Client());
});

// Repository provider
final mealRepositoryProvider = Provider<MealRepositoryImpl>((ref) {
  return MealRepositoryImpl(ref.watch(mealRemoteDataSourceProvider));
});

// Random meal provider
final randomMealProvider = Provider<GetRandomMeal>((ref) {
  return GetRandomMeal(ref.watch(mealRepositoryProvider));
});

final randomMeal = FutureProvider<Meal>((ref) async {
  return ref.watch(randomMealProvider).execute();
});

// Categories provider
final categoriesProvider = Provider<GetMealCategories>((ref) {
  return GetMealCategories(ref.watch(mealRepositoryProvider));
});

final mealCategories = FutureProvider<List<MealCategory>>((ref) async {
  return ref.watch(categoriesProvider).execute();
});