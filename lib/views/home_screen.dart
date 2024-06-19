import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meals_app/domain/use_cases/get_random_meal.dart';
import 'package:meals_app/views/bloc/meal_bloc.dart';
import 'package:meals_app/views/bloc/meal_error.dart';
import 'package:meals_app/views/bloc/meal_event.dart';
import 'package:meals_app/views/bloc/meal_state.dart';
import 'package:meals_app/views/meal_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required this.getRandomMeal});
  final GetRandomMeal getRandomMeal;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MealBloc(getRandomMeal)..add(GetMealEvent()),
      child: Scaffold(
        appBar: AppBar(title: const Text('Random Meal')),
        body: Center(
          child: BlocBuilder<MealBloc, MealState>(
            builder: (context, state) {
              if (state is MealLoading) {
                return const CircularProgressIndicator();
              } else if (state is MealLoaded) {
                return MealWidget(meal: state.meal);
              } else if (state is MealError) {
                return Text(state.message);
              } else {
                return const SizedBox();
              }
            },
          ),
        ),
      ),
    );
  }
}
