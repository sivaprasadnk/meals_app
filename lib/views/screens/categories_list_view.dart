import 'package:flutter/material.dart';

import '../../domain/entities/meal_category.dart';

class CategoriesListView extends StatelessWidget {
  const CategoriesListView({super.key, required this.categories});
  final List<MealCategory> categories;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Image.network(
                  category.strCategoryThumb,
                  key: Key(category.strCategoryThumb),
                  height: 50.0,
                  width: 50.0,
                  errorBuilder: (context, error, stackTrace) {
                    return const SizedBox(
                      height: 50.0,
                      width: 50.0,
                      child: Center(
                        child: Icon(Icons.error),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 5.0),
                Text(category.strCategory),
              ],
            ),
          );
        },
      ),
    );
  }
}
