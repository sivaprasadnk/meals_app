import 'package:get/get.dart';
import 'package:meals_app/domain/entities/meal.dart';
import 'package:meals_app/domain/entities/meal_category.dart';
import 'package:meals_app/domain/use_cases/get_meal_category.dart';
import 'package:meals_app/domain/use_cases/get_random_meal.dart';

class MealsController extends GetxController {
  final GetRandomMeal getRandomMeal;
  final GetMealCategories getMealCategories;

  MealsController({
    required this.getRandomMeal,
    required this.getMealCategories,
  });

  var randomMeal = Meal(
    idMeal: '',
    strMeal: '',
    strCategory: '',
    strArea: '',
    strInstructions: '',
    strMealThumb: '',
    strTags: '',
    strYoutube: "",
    strSource: "",
    ingredients: {},
  ).obs;

  RxList<MealCategory> mealCategories = <MealCategory>[].obs;

  @override
  void onInit() {
    fetchRandomMeal();
    fetchMealCategories();
    super.onInit();
  }

  void fetchRandomMeal() async {
    try {
      final meal = await getRandomMeal.execute();
      randomMeal.value = meal;
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }

  void fetchMealCategories() async {
    try {
      List<MealCategory> categories = await getMealCategories.execute();
      mealCategories.value = categories;
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }
}
