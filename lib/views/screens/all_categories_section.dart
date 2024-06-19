import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meals_app/views/bloc/meal_category/meal_category_bloc.dart';
import 'package:meals_app/views/screens/categories_list_view.dart';
import 'package:meals_app/views/screens/loading_categories.dart';

class AllCategoriesSection extends StatelessWidget {
  const AllCategoriesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text('Categories'),
        ),
        const SizedBox(height: 15),
        BlocBuilder<MealCategoryBloc, MealCategoryState>(
          builder: (context, state) {
            if (state is MealCategoryLoadingState) {
              return const Center(child: LoadingCategories());
            } else if (state is MealCategoryLoadedState) {
              return CategoriesListView(categories: state.categories);
            } else if (state is MealCategoryErrorState) {
              return Center(child: Text('Error: ${state.error}'));
            }
            return const SizedBox.shrink();
          },
        ),
      ],
    );
  }
}
