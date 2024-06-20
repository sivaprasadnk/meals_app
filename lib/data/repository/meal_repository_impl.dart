import 'package:flutter/material.dart';
import 'package:meals_app/data/data_sources/meal_remote_data_source.dart';
import 'package:meals_app/data/models/meal_category_model.dart';
import 'package:meals_app/data/models/meal_model.dart';
import 'package:meals_app/domain/entities/meal.dart';
import 'package:meals_app/domain/repository/meal_repository.dart';

class MealRepositoryImpl implements MealRepository {
  final MealRemoteDataSource remoteDataSource;

  MealRepositoryImpl(this.remoteDataSource);

  @override
  Future<MealModel> getRandomMeal() async {
    final mealData = await remoteDataSource.getRandomMeal();
    return MealModel.fromJson(mealData['meals'][0]);
  }

  @override
  Future<List<MealCategoryModel>> getMealCategories() async {
    final data = await remoteDataSource.getMealCategories();
    return (data['categories'] as List)
        .map((e) => MealCategoryModel.fromJson(e))
        .toList();
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
