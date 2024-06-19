import 'package:meals_app/domain/entities/meal.dart';

class MealByCategoryModel extends Meal {
  MealByCategoryModel({
    required super.idMeal,
    required super.strMeal,
    required super.strCategory,
    required super.strArea,
    required super.strInstructions,
    required super.strMealThumb,
    required super.strTags,
    required super.strYoutube,
    required super.strSource,
    required super.ingredients,
  });

  factory MealByCategoryModel.fromJson(Map<String, dynamic> json) {
    final ingredients = <String, String>{};
    for (int i = 1; i <= 20; i++) {
      final ingredient = json['strIngredient$i'];
      final measure = json['strMeasure$i'];
      if (ingredient != null && ingredient.isNotEmpty) {
        ingredients[ingredient] = measure ?? '';
      }
    }
    return MealByCategoryModel(
      idMeal: json['idMeal'],
      strMeal: json['strMeal'],
      strCategory: json['strCategory'],
      strArea: json['strArea'],
      strInstructions: json['strInstructions'],
      strMealThumb: json['strMealThumb'],
      strTags: json['strTags'],
      strYoutube: json['strYoutube'],
      strSource: json['strSource'],
      ingredients: ingredients,
    );
  }
}
