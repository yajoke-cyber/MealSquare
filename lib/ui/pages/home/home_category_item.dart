import 'package:flutter/material.dart';
import 'package:food/ui/pages/meals/meal.dart';

import '../../../core/model/category_model.dart';

class HomeContentItem extends StatelessWidget {
  final CategoryModel _category;
  const HomeContentItem(this._category, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bgColor = _category.finalColor ?? Colors.red;
    return GestureDetector(
      child: Container(
        decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(12),
            gradient:
                LinearGradient(colors: [bgColor.withOpacity(.5), bgColor])),
        alignment: Alignment.center,
        child: Text(
          _category.title ?? "",
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      onTap: () {
        Navigator.of(context)
            .pushNamed(MealScreen.routeName, arguments: _category);
      },
    );
  }
}
