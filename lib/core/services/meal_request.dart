import 'package:food/core/model/meal_model.dart';
import 'package:food/core/services/http_request.dart';

class MealRequest {
  static Future<List<MealModel>> getMealData() async {
    const url = '/meal';
    final result = await HttpRequest.request(url);
    final mealArr = result['meal'];
    List<MealModel> meals = [];
    for (var json in mealArr) {
      meals.add(MealModel.fromJson(json));
    }
    return meals;
  }
}
