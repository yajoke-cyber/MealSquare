import 'package:flutter/cupertino.dart';
import 'package:food/core/model/meal_model.dart';

class FavorViewModel extends ChangeNotifier {
  final List<MealModel> _favories = [];
  List<MealModel> get favorMeals {
    return _favories;
  }

  void addMeal(MealModel meal) {
    _favories.add(meal);
    notifyListeners();
  }

  void removeMeal(MealModel meal) {
    _favories.remove(meal);
    notifyListeners();
  }

  void toggleMeal(MealModel meal) {
    if (isFavor(meal)) {
      removeMeal(meal);
    } else {
      addMeal(meal);
    }
    notifyListeners();
  }

  bool isFavor(MealModel meal) {
    return _favories.contains(meal);
  }
}
