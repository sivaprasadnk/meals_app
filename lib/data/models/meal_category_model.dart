import 'package:meals_app/domain/entities/meal_category.dart';

class MealCategoryModel extends MealCategory {
  MealCategoryModel({
    required super.idCategory,
    required super.strCategory,
    required super.strCategoryThumb,
    required super.strCategoryDescription,
  });

  factory MealCategoryModel.fromJson(Map<String, dynamic> json) {
    return MealCategoryModel(
      idCategory: json['idCategory'],
      strCategory: json['strCategory'],
      strCategoryThumb: json['strCategoryThumb'],
      strCategoryDescription: json['strCategoryDescription'],
    );
  }
}
