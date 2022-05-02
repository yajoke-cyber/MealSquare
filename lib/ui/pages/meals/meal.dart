import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food/core/model/category_model.dart';
import 'package:food/ui/pages/meals/meal_content.dart';

class MealScreen extends StatelessWidget {
  static const String routeName = "/meal";
  const MealScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final category =
        ModalRoute.of(context)?.settings.arguments as CategoryModel;
    return Scaffold(
      appBar: AppBar(
        title: Text(category.title ?? ""),
      ),
      body: const MealContent(),
    );
  }
}
