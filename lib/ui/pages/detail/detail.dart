import 'package:flutter/material.dart';
import 'package:food/core/model/meal_model.dart';
import 'package:food/ui/pages/detail/detail_content.dart';
import 'package:provider/provider.dart';

import '../../../core/store/favor_viewmodel.dart';

class DetailScreen extends StatelessWidget {
  static String routeName = '/detail';
  const DetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final meal = ModalRoute.of(context)?.settings.arguments as MealModel;
    return Scaffold(
        appBar: AppBar(
          title: Text(meal.title ?? ""),
        ),
        body: DetailContent(meal),
        floatingActionButton:
            Consumer<FavorViewModel>(builder: (ctx, favorVM, child) {
          final iconData =
              favorVM.isFavor(meal) ? Icons.favorite : Icons.favorite_border;
          final iconColor = favorVM.isFavor(meal) ? Colors.red : Colors.black;
          return FloatingActionButton(
            onPressed: () {
              favorVM.toggleMeal(meal);
            },
            child: Icon(iconData, color: iconColor),
            backgroundColor: Colors.amber,
          );
        }));
  }
}
