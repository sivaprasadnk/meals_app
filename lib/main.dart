import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:meals_app/data/data_sources/meal_remote_data_source.dart';
import 'package:meals_app/data/repository/meal_repository_impl.dart';
import 'package:meals_app/domain/use_cases/get_random_meal.dart';
import 'package:meals_app/views/home_screen.dart';

void main() {
  final MealRemoteDataSource dataSource = MealRemoteDataSource(http.Client());
  final MealRepositoryImpl repository = MealRepositoryImpl(dataSource);
  final GetRandomMeal getRandomMeal = GetRandomMeal(repository);
  runApp(MealsApp(getRandomMeal: getRandomMeal));
}

class MealsApp extends StatelessWidget {
  const MealsApp({super.key, required this.getRandomMeal});
  final GetRandomMeal getRandomMeal;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meals App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomeScreen(
        getRandomMeal: getRandomMeal,
      ),
    );
  }
}
