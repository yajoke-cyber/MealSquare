import 'package:flutter/material.dart';
import 'package:food/core/extension/int_extension.dart';
import 'package:food/ui/pages/detail/detail.dart';
import 'package:provider/provider.dart';

import '../../core/model/meal_model.dart';
import '../../core/store/favor_viewmodel.dart';
import 'operation_item.dart';

class MealItem extends StatelessWidget {
  final MealModel _meal;

  MealItem(this._meal, {Key? key}) : super(key: key);
  final _cardRadius = 12.px;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        margin: EdgeInsets.all(10.px),
        elevation: 5,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(_cardRadius)),
        child: Column(
          children: [buildBasicInfo(), buildOperationInfo()],
        ),
      ),
      onTap: () {
        Navigator.of(context)
            .pushNamed(DetailScreen.routeName, arguments: _meal);
      },
    );
  }

  Widget buildBasicInfo() {
    return Stack(
      children: [
        //需要把图片裁剪为圆角，不然其默认为正方形会默认覆盖后面的圆角Card
        ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(_cardRadius),
            topRight: Radius.circular(_cardRadius),
          ),
          child: Image.network(
            _meal.imageUrl ?? "",
            width: double.infinity,
            height: 250.px,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
            right: 10.px,
            bottom: 10.px,
            child: Container(
              width: 300.px,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                  color: Colors.black87,
                  borderRadius: BorderRadius.circular(5.px)),
              child: Text(
                _meal.title ?? "",
                style: TextStyle(color: Colors.white, fontSize: 22.px),
              ),
            ))
      ],
    );
  }

  Widget buildOperationInfo() {
    return Padding(
      padding: EdgeInsets.all(16.px),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          OperationItem(const Icon(Icons.schedule), "${_meal.duration}分钟"),
          OperationItem(const Icon(Icons.restaurant), "${_meal.complexityStr}"),
          buildFavorItem(_meal)
        ],
      ),
    );
  }

  Widget buildFavorItem(MealModel meal) {
    return Consumer<FavorViewModel>(builder: (ctx, favorVM, child) {
      final iconData =
          favorVM.isFavor(meal) ? Icons.favorite : Icons.favorite_border;
      final iconColor = favorVM.isFavor(meal) ? Colors.red : Colors.black;
      final favorText = favorVM.isFavor(meal) ? "已收藏" : "未收藏";
      return GestureDetector(
        child: OperationItem(Icon(iconData, color: iconColor), favorText),
        onTap: () {
          favorVM.toggleMeal(meal);
        },
      );
    });
  }
}
