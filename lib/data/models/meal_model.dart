import 'package:meals_app/domain/entities/meal.dart';

// MealModel mealModelFromJson(String str) => MealModel.fromJson(json.decode(str));

// String mealModelToJson(MealModel data) => json.encode(data.toJson());


class MealModel extends Meal {
  MealModel({
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

  factory MealModel.fromJson(Map<String, dynamic> json) {
    final ingredients = <String, String>{};
    // if (json.containsKey('strIngredient')) {
      for (int i = 1; i <= 20; i++) {
        final ingredient = json['strIngredient$i'];
        final measure = json['strMeasure$i'];
        if (ingredient != null && ingredient.isNotEmpty) {
          ingredients[ingredient] = measure ?? '';
        }
      }
    // }
    return MealModel(
      idMeal: json['idMeal'],
      strMeal: json['strMeal'],
      strCategory: json.containsKey('strCategory') ? json['strCategory'] : "",
      strArea: json.containsKey('strArea') ? json['strArea'] : "",
      strInstructions:
          json.containsKey('strInstructions') ? json['strInstructions'] : "",
      strMealThumb: json['strMealThumb'],
      strTags: json['strTags'],
      strYoutube: json['strYoutube'],
      strSource: json['strSource'],
      ingredients: ingredients,
    );
  }
}
