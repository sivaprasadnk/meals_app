import 'package:flutter/material.dart';
import 'package:meals_app/domain/entities/meal.dart';
import 'package:url_launcher/url_launcher.dart';

class MealWidget extends StatelessWidget {
  final Meal meal;

  const MealWidget({super.key, required this.meal});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            meal.strMeal!,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8.0),
          Image.network(
            meal.strMealThumb!,
            height: 200,
            width: 200,
            errorBuilder: (context, error, stackTrace) {
              return const SizedBox(
                width: 200,
                height: 200,
                child: Center(
                  child: Icon(
                    Icons.error,
                  ),
                ),
              );
            },
          ),
          const SizedBox(height: 8.0),
          Text(
            'Category: ${meal.strCategory}',
            style: const TextStyle(fontSize: 18),
          ),
          // Text(
          //   'Area: ${meal.strArea}',
          //   style: const TextStyle(fontSize: 18),
          // ),
          const SizedBox(height: 16.0),
          const Text(
            'Instructions',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8.0),
          Text(
            meal.strInstructions ?? "",
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 16.0),
          const Text(
            'Youtube',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8.0),
          GestureDetector(
            onTap: () async {
              await launchUrl(Uri.parse(meal.strYoutube!));
            },
            child: Text(
              meal.strYoutube ?? "",
              style: const TextStyle(fontSize: 16),
            ),
          ),

          const SizedBox(height: 16.0),
          const Text(
            'Ingredients',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8.0),
          ..._buildIngredientsList(meal.ingredients ?? {}),
        ],
      ),
    );
  }

  List<Widget> _buildIngredientsList(Map<String, String> ingredients) {
    List<Widget> ingredientsList = [];
    ingredients.forEach((ingredient, measure) {
      ingredientsList.add(
        Row(
          children: [
            Image.network(
              'https://www.themealdb.com/images/ingredients/$ingredient.png',
              width: 50,
              height: 50,
              errorBuilder: (context, error, stackTrace) {
                return const SizedBox(
                  width: 50,
                  height: 50,
                  child: Center(
                    child: Icon(
                      Icons.error,
                    ),
                  ),
                );
              },
            ),
            const SizedBox(width: 10),
            Text(
              '$ingredient - $measure',
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      );
    });
    return ingredientsList;
  }
}
