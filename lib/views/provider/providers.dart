// presentation/providers/meal_providers.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:meals_app/data/data_sources/meal_local_data_source.dart';
import 'package:meals_app/data/data_sources/meal_remote_data_source.dart';
import 'package:meals_app/data/models/meal_category_hive_model.dart';
import 'package:meals_app/data/models/meal_hive_model.dart';
import 'package:meals_app/data/repository/meal_repository_impl.dart';
import 'package:meals_app/domain/entities/meal.dart';
import 'package:meals_app/domain/entities/meal_category.dart';
import 'package:meals_app/domain/use_cases/get_meal_category.dart';
import 'package:meals_app/domain/use_cases/get_random_meal.dart';

// Data source provider
final mealRemoteDataSourceProvider = Provider<MealRemoteDataSource>((ref) {
  return MealRemoteDataSource(http.Client());
});

final mealLocalDataSourceProvider = Provider<MealLocalDataSource>((ref) {
  return MealLocalDataSource(
    Hive.box<MealHiveModel>('meals'),
    Hive.box<MealCategoryHiveModel>('categories'),
  );
});
// Repository provider
final mealRepositoryProvider = Provider<MealRepositoryImpl>((ref) {
  return MealRepositoryImpl(
    ref.watch(mealRemoteDataSourceProvider),
    ref.watch(mealLocalDataSourceProvider),
  );
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
