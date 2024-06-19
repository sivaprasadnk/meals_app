import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MealRemoteDataSource {
  final http.Client client;

  MealRemoteDataSource(this.client);

  Future<Map<String, dynamic>> getRandomMeal() async {
    final response = await client
        .get(Uri.parse('https://www.themealdb.com/api/json/v1/1/random.php'));
    debugPrint('@@ response :${response.body}');
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load meal');
    }
  }
}
