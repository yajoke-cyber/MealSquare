import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food/core/model/category_model.dart';
import 'package:food/core/model/meal_model.dart';
import 'package:food/core/store/meal_viewmodel.dart';
import 'package:provider/provider.dart';

import '../../widgets/meal_item.dart';

class MealContent extends StatelessWidget {
  const MealContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final category =
        ModalRoute.of(context)?.settings.arguments as CategoryModel;
    //这里最好不要用consumer不然里面的的widget每次数据更新都要重建;
    return Selector<MealViewModel, List<MealModel>>(
      selector: (ctx, mealVM) => mealVM.meals
          .where((meal) => (meal.categories ?? []).contains(category.id))
          .toList(),
      shouldRebuild: (prev, next) => !const ListEquality().equals(prev, next),
      builder: (ctx, meals, child) {
        return ListView.builder(
            itemCount: meals.length,
            itemBuilder: (ctx, index) {
              return MealItem(meals[index]);
            });
      },
    );
  }
}
