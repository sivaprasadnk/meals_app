import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:meals_app/data/data_sources/meal_remote_data_source.dart';
import 'package:meals_app/data/repository/meal_repository_impl.dart';
import 'package:meals_app/domain/use_cases/get_meal_categories.dart';
import 'package:meals_app/domain/use_cases/get_random_meal.dart';
import 'package:meals_app/views/home_screen.dart';
import 'package:meals_app/views/provider/meal_provider.dart';
import 'package:provider/provider.dart';

void main() {
  final MealRemoteDataSource dataSource = MealRemoteDataSource(http.Client());
  final MealRepositoryImpl repository = MealRepositoryImpl(dataSource);
  final GetRandomMeal getRandomMeal = GetRandomMeal(repository);
  final GetMealCategries getMealCategries = GetMealCategries(repository);
  runApp(MealsApp(
    getRandomMeal: getRandomMeal,
    getMealCategries: getMealCategries,
  ));
}

class MealsApp extends StatelessWidget {
  const MealsApp(
      {super.key, required this.getRandomMeal, required this.getMealCategries});
  final GetRandomMeal getRandomMeal;
  final GetMealCategries getMealCategries;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: MealProvider()
            ..fetchRandomMeal(getRandomMeal)
            ..fetchMealCategories(getMealCategries),
        ),
      ],
      child: MaterialApp(
        title: 'Meals App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: HomeScreen(
          getRandomMeal: getRandomMeal,
          getMealCategries: getMealCategries,
        ),
      ),
    );
  }
}
