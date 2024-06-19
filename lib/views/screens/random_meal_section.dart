import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meals_app/views/bloc/random_meal/random_meal_bloc.dart';
import 'package:meals_app/views/screens/meal_widget.dart';

class RandomMealSection extends StatelessWidget {
  const RandomMealSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.8,
      child: BlocBuilder<RandomMealBloc, MealState>(
        builder: (context, state) {
          if (state is MealLoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is MealLoadedState) {
            return MealWidget(meal: state.meal);
          } else if (state is MealErrorState) {
            return Center(child: Text('Error: ${state.error}'));
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
