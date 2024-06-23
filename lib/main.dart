import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meals_app/data/models/meal_category_hive_model.dart';
import 'package:meals_app/data/models/meal_hive_model.dart';
import 'package:meals_app/views/screens/home_screen.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(MealHiveModelAdapter());
  Hive.registerAdapter(MealCategoryHiveModelAdapter());
  await Hive.openBox<MealHiveModel>('meals');
  await Hive.openBox<MealCategoryHiveModel>('categories');
  runApp(
    const MealsApp(),
  );
}

class MealsApp extends StatelessWidget {
  const MealsApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        title: 'Meals App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
