import 'package:hive/hive.dart';
import 'package:meals_app/data/models/meal_category_hive_model.dart';
import 'package:meals_app/data/models/meal_hive_model.dart';

class MealLocalDataSource {
  final Box<MealHiveModel> mealBox;
  final Box<MealCategoryHiveModel> categoryBox;
  MealLocalDataSource(
    this.categoryBox,
    this.mealBox,
  );

  Future<MealHiveModel?> getCachedRandomMeal() async {
    return mealBox.get('randomMeal');
  }

  Future<List<MealCategoryHiveModel>> getCachedCategories() async {
    return categoryBox.values.toList();
  }

  Future<void> cacheRandomMeal(MealHiveModel meal) async {
    await mealBox.put('randomMeal', meal);
  }

  Future<void> cacheCategories(List<MealCategoryHiveModel> categories) async {
    await categoryBox
        .putAll(Map.fromIterable(categories, key: (e) => e.idCategory));
  }
}
