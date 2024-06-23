// data/models/category_hive_model.dart
import 'package:hive/hive.dart';

part 'meal_category_hive_model.g.dart';

@HiveType(typeId: 1)
class MealCategoryHiveModel extends HiveObject {
  @HiveField(0)
  String idCategory;
  @HiveField(1)
  String strCategory;
  @HiveField(2)
  String strCategoryThumb;
  @HiveField(3)
  String strCategoryDescription;

  MealCategoryHiveModel({
    required this.idCategory,
    required this.strCategory,
    required this.strCategoryThumb,
    required this.strCategoryDescription,
  });
}
