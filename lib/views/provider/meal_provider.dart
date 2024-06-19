import 'package:flutter/material.dart';
import 'package:meals_app/domain/entities/meal.dart';
import 'package:meals_app/domain/entities/meal_category.dart';
import 'package:meals_app/domain/use_cases/get_meal_categories.dart';
import 'package:meals_app/domain/use_cases/get_random_meal.dart';
import 'package:meals_app/views/provider/meal_error.dart';

class MealProvider extends ChangeNotifier {
  Meal? _meal;
  List<MealCategory> _mealCategories = [];

  String? _errorMessage = '';
  bool _isLoading = true;
  MealError? _mealError;

  Meal? get meal => _meal;
  String get errorMessage => _errorMessage!;
  bool get isLoading => _isLoading;
  MealError? get mealError => _mealError;
  List<MealCategory> get mealCategories => _mealCategories;

  Future<void> fetchRandomMeal(GetRandomMeal getRandomMeal) async {
    _meal = null;
    _isLoading = true;
    _errorMessage = "";
    notifyListeners();
    try {
      _meal = await getRandomMeal.execute();
      _isLoading = false;
      _errorMessage = "";
      notifyListeners();
    } catch (e) {
      _mealError = (MealError(e.toString()));
      notifyListeners();
    }
  }

  Future<void> fetchMealCategories(GetMealCategries getMealCategries) async {
    _mealCategories = [];
    _isLoading = true;
    _errorMessage = "";
    notifyListeners();
    try {
      _mealCategories = await getMealCategries.execute();
      _isLoading = false;
      _errorMessage = "";
      notifyListeners();
    } catch (e) {
      _mealError = (MealError(e.toString()));
      notifyListeners();
    }
  }
}
