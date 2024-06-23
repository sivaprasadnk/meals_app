import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/views/provider/meal_providers.dart';
import 'package:meals_app/views/screens/meal_widget.dart';

class RandomMealSection extends ConsumerWidget {
  const RandomMealSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final meal = ref.watch(randomMeal);
    return meal.value == null
        ? const SizedBox.shrink()
        : SizedBox(
            child: meal.when(
              data: (data) {
                return MealWidget(meal: data!);
              },
              loading: () {
                return const Center(child: CircularProgressIndicator());
              },
              error: (error, stackTrace) {
                return Center(child: Text(error.toString()));
              },
            ),
          );
  }
}
