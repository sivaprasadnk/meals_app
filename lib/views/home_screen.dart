import 'package:flutter/material.dart';
import 'package:meals_app/domain/use_cases/get_meal_categories.dart';
import 'package:meals_app/domain/use_cases/get_random_meal.dart';
import 'package:meals_app/views/meal_widget.dart';
import 'package:meals_app/views/provider/meal_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
    required this.getRandomMeal,
    required this.getMealCategries,
  });
  final GetRandomMeal getRandomMeal;
  final GetMealCategries getMealCategries;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meals App'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Consumer<MealProvider>(
            builder: (context, mealProvider, child) {
              if (mealProvider.errorMessage.isNotEmpty) {
                return Center(child: Text(mealProvider.errorMessage));
              } else if (mealProvider.mealCategories.isEmpty) {
                return const Center(child: CircularProgressIndicator());
              } else {
                return GestureDetector(
                  onTap: () {
                    mealProvider.fetchRandomMeal(getRandomMeal);
                  },
                  child: MealWidget(meal: mealProvider.meal!),
                );
              }
            },
          ),
          Consumer<MealProvider>(
            builder: (context, mealProvider, _) {
              if (mealProvider.errorMessage.isNotEmpty) {
                return Center(child: Text(mealProvider.errorMessage));
              } else if (mealProvider.meal == null) {
                return const Center(child: CircularProgressIndicator());
              } else {
                return GestureDetector(
                  onTap: () {
                    mealProvider.fetchRandomMeal(getRandomMeal);
                  },
                  child: MealWidget(meal: mealProvider.meal!),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
