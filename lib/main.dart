import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:meals_app/data/data_sources/meal_remote_data_source.dart';
import 'package:meals_app/data/repository/meal_repository_impl.dart';
import 'package:meals_app/domain/use_cases/get_meal_category.dart';
import 'package:meals_app/domain/use_cases/get_meals_by_category.dart';
import 'package:meals_app/domain/use_cases/get_random_meal.dart';
import 'package:meals_app/views/controller/meals_controller.dart';
import 'package:meals_app/views/screens/home_screen.dart';

void main() {
  final MealRemoteDataSource dataSource = MealRemoteDataSource(http.Client());
  final MealRepositoryImpl repository = MealRepositoryImpl(dataSource);
  final GetRandomMeal getRandomMeal = GetRandomMeal(repository);
  final GetMealCategories getMealCategories = GetMealCategories(repository);
  final GetMealsByCategory getMealsByCategory = GetMealsByCategory(repository);
  runApp(
    MealsApp(
      getRandomMeal: getRandomMeal,
      getMealCategories: getMealCategories,
      getMealsByCategory: getMealsByCategory,
    ),
  );
}

class MealsApp extends StatelessWidget {
  const MealsApp({
    super.key,
    required this.getRandomMeal,
    required this.getMealCategories,
    required this.getMealsByCategory,
  });
  final GetRandomMeal getRandomMeal;
  final GetMealCategories getMealCategories;
  final GetMealsByCategory getMealsByCategory;
  @override
  Widget build(BuildContext context) {
    Get.put(MealsController(
      getRandomMeal: getRandomMeal,
      getMealCategories: getMealCategories,
    ));

    return GetMaterialApp(
      title: 'Meals App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
