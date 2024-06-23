import 'package:flutter/material.dart';
import 'package:meals_app/data/data_sources/meal_local_data_source.dart';
import 'package:meals_app/data/data_sources/meal_remote_data_source.dart';
import 'package:meals_app/data/models/meal_category_hive_model.dart';
import 'package:meals_app/data/models/meal_category_model.dart';
import 'package:meals_app/data/models/meal_hive_model.dart';
import 'package:meals_app/data/models/meal_model.dart';
import 'package:meals_app/domain/entities/meal.dart';
import 'package:meals_app/domain/repository/meal_repository.dart';

class MealRepositoryImpl implements MealRepository {
  final MealRemoteDataSource remoteDataSource;
  final MealLocalDataSource localDataSource;

  MealRepositoryImpl(
    this.remoteDataSource,
    this.localDataSource,
  );

  @override
  Future<MealModel> getRandomMeal() async {
    final mealData = await remoteDataSource.getRandomMeal();
    var meal = MealModel.fromJson(mealData['meals'][0]);
    await localDataSource.cacheRandomMeal(MealHiveModel(
      idMeal: meal.idMeal ?? "",
      strMeal: meal.strMeal ?? "",
      strCategory: meal.strCategory ?? "",
      strArea: meal.strArea ?? "",
      strInstructions: meal.strInstructions ?? "",
      strMealThumb: meal.strMealThumb ?? "",
      strTags: meal.strTags ?? "",
    ));
    return meal;
  }

  @override
  Future<List<MealCategoryModel>> getMealCategories() async {
    final data = await remoteDataSource.getMealCategories();
    var categories = (data['categories'] as List)
        .map((e) => MealCategoryModel.fromJson(e))
        .toList();
    await localDataSource.cacheCategories(categories
        .map((category) => MealCategoryHiveModel(
              idCategory: category.idCategory,
              strCategory: category.strCategory,
              strCategoryThumb: category.strCategoryThumb,
              strCategoryDescription: category.strCategoryDescription,
            ))
        .toList());
    return categories;
  }

  @override
  Future<List<Meal>> getMealsByCategory(String category) async {
    final mealData = await remoteDataSource.getMealsByCategory(category);
    debugPrint('@@ response :${(mealData['meals'] as List).first}');
    return (mealData['meals'] as List)
        .map((e) => MealModel.fromJson(e))
        .toList();
  }
}
