import 'package:flutter/cupertino.dart';
import 'package:food/core/model/meal_model.dart';
import 'package:food/core/services/meal_request.dart';
import 'package:food/core/store/filter_viewmodel.dart';

class MealViewModel extends ChangeNotifier {
  List<MealModel> _meals = [];
  FilterViewModel? _filterVM;
  List<MealModel> get meals {
    List<MealModel> filterMeals = _meals.where((meal) {
      if ((_filterVM?.isGlutenFree ?? false) && !(meal.isGlutenFree ?? false)) {
        return false;
      }
      if ((_filterVM?.isVegetarian ?? false) && !(meal.isVegetarian ?? false)) {
        return false;
      }
      if ((_filterVM?.isVegan ?? false) && !(meal.isVegan ?? false)) {
        return false;
      }
      if ((_filterVM?.isLactoseFree ?? false) &&
          !(meal.isLactoseFree ?? false)) {
        return false;
      }
      return true;
    }).toList();

    return filterMeals;
  }

  void updateFilters(FilterViewModel filterVM) {
    _filterVM = filterVM;
  }

  MealViewModel() {
    MealRequest.getMealData().then((res) {
      _meals = res;
      //通知所有依赖的地方来使用最新的数据
      notifyListeners();
    });
  }
}
