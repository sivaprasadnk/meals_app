import 'package:meals_app/data/data_sources/meal_remote_data_source.dart';
import 'package:meals_app/data/models/meal_model.dart';
import 'package:meals_app/domain/entities/meal.dart';
import 'package:meals_app/domain/entities/meal_category.dart';
import 'package:meals_app/domain/repository/meal_repository.dart';

class MealRepositoryImpl implements MealRepository {
  final MealRemoteDataSource remoteDataSource;

  MealRepositoryImpl(this.remoteDataSource);

  @override
  Future<Meal> getRandomMeal() async {
    final mealData = await remoteDataSource.getRandomMeal();
    return MealModel.fromJson(mealData['meals'][0]);
  }

  @override
  Future<List<MealCategory>> getMealCategories() {
    throw UnimplementedError();
  }
}
