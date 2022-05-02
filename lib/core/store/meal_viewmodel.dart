import 'package:flutter/cupertino.dart';
import 'package:food/core/model/meal_model.dart';
import 'package:food/core/services/meal_request.dart';

class MealViewModel extends ChangeNotifier {
  List<MealModel> _meals = [];
  List<MealModel> get meals {
    return _meals;
  }

  MealViewModel() {
    MealRequest.getMealData().then((res) {
      _meals = res;
      //通知所有依赖的地方来使用最新的数据
      notifyListeners();
    });
  }
}
