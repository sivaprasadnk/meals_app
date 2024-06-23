// data/models/meal_hive_model.dart
import 'package:hive/hive.dart';

part 'meal_hive_model.g.dart';

@HiveType(typeId: 0)
class MealHiveModel extends HiveObject {
  @HiveField(0)
  String idMeal;
  @HiveField(1)
  String strMeal;
  @HiveField(2)
  String strCategory;
  @HiveField(3)
  String strArea;
  @HiveField(4)
  String strInstructions;
  @HiveField(5)
  String strMealThumb;
  @HiveField(6)
  String strTags;

  MealHiveModel({
    required this.idMeal,
    required this.strMeal,
    required this.strCategory,
    required this.strArea,
    required this.strInstructions,
    required this.strMealThumb,
    required this.strTags,
  });
}
