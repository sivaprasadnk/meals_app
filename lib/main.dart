import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:meals_app/data/data_sources/meal_remote_data_source.dart';
import 'package:meals_app/data/repository/meal_repository_impl.dart';
import 'package:meals_app/domain/use_cases/get_meal_category.dart';
import 'package:meals_app/domain/use_cases/get_meals_by_category.dart';
import 'package:meals_app/domain/use_cases/get_random_meal.dart';
import 'package:meals_app/views/bloc/meal_category/meal_category_bloc.dart';
import 'package:meals_app/views/bloc/meals_by_category/meals_by_category_bloc.dart';
import 'package:meals_app/views/bloc/random_meal/random_meal_bloc.dart';
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
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              RandomMealBloc(getRandomMeal)..add(FetchRandomMealEvent()),
        ),
        BlocProvider(
          create: (context) => MealCategoryBloc(getMealCategories)
            ..add(FetchMealCategoriesEvent()),
        ),
        BlocProvider(
          create: (context) => MealsByCategoryBloc(getMealsByCategory),
        )
      ],
      child: MaterialApp(
        title: 'Meals App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
