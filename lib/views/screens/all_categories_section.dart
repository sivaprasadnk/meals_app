import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/views/provider/meal_providers.dart';
import 'package:meals_app/views/screens/categories_list_view.dart';
import 'package:meals_app/views/screens/loading_categories.dart';

class AllCategoriesSection extends ConsumerWidget {
  const AllCategoriesSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var categories = ref.watch(mealCategories);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text('Categories'),
        ),
        categories.when(
          data: (data) {
            return CategoriesListView(categories: data);
          },
          loading: () {
            return const Center(
              child: LoadingCategories(),
            );
          },
          error: (error, stackTrace) {
            return Text(error.toString());
          },
        )
      ],
    );
  }
}
