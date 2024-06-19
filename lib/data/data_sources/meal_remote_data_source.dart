import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:meals_app/utils/string_constants.dart';

class MealRemoteDataSource {
  final http.Client client;

  MealRemoteDataSource(this.client);

  Future<Map<String, dynamic>> getRandomMeal() async {
    var url = baseUrl + randomMealEndPoint;
    final response = await client.get(Uri.parse(url));
    // debugPrint('@@getRandomMeal response :${response.body}');
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load meal');
    }
  }

  Future<Map<String, dynamic>> getMealCategories() async {
    var url = baseUrl + mealCategoriesEndPoint;
    final response = await client.get(Uri.parse(url));
    debugPrint('@@getMealCategories response :${response.body}');
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load meal catrgories');
    }
  }
}
