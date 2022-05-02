import 'package:flutter/material.dart';
import 'package:food/core/extension/int_extension.dart';
import 'package:food/core/model/category_model.dart';
import 'package:food/core/services/json_parse.dart';
import 'package:food/core/services/meal_request.dart';

import 'home_category_item.dart';

class HomeScreenContent extends StatelessWidget {
  const HomeScreenContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MealRequest.getMealData().then((value) => print(value));
    return FutureBuilder<List<CategoryModel>>(
        future: JsonParse.getCategoryData(),
        builder: (ctx, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          final categories = snapshot.data;
          return GridView.builder(
              padding: EdgeInsets.all(20.px),
              itemCount: categories?.length,
              //当前有const时，此时对象传入的值也必须时const即为运行时常量
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 20.px,
                  mainAxisSpacing: 20.px,
                  childAspectRatio: 1.5),
              itemBuilder: (ctx, index) {
                return HomeContentItem(categories![index]);
              });
        });
  }
}
