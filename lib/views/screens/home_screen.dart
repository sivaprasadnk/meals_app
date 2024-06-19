import 'package:flutter/material.dart';
import 'package:meals_app/domain/use_cases/get_meal_category.dart';
import 'package:meals_app/domain/use_cases/get_random_meal.dart';
import 'package:meals_app/views/screens/all_categories_section.dart';
import 'package:meals_app/views/screens/random_meal_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
    required this.getRandomMeal,
    required this.getMealCategories,
  });
  final GetRandomMeal getRandomMeal;
  final GetMealCategories getMealCategories;
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AllCategoriesSection(),
            RandomMealSection(),
          ],
        ),
      ),
    );
  }
}
