import 'package:flutter/material.dart';
import 'package:meals_app/views/screens/all_categories_section.dart';
import 'package:meals_app/views/screens/random_meal_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });
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
