import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food/core/extension/int_extension.dart';

import '../../../core/model/meal_model.dart';

class DetailContent extends StatelessWidget {
  final MealModel _meal;
  const DetailContent(this._meal, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          buildBannerImage(),
          buildMakeTitle('制作材料'),
          buildMakeMaterial(context),
          buildMakeTitle('步骤'),
          buildMakeSteps(context)
        ],
      ),
    );
  }

  Widget buildBannerImage() {
    return Container(
        width: double.infinity, child: Image.network(_meal.imageUrl ?? ""));
  }

  Widget buildMakeMaterial(BuildContext context) {
    return buildContentList(
        context: context,
        child: ListView.builder(
            padding: EdgeInsets.all(8.px),
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: _meal.ingredients?.length,
            itemBuilder: (ctx, index) {
              return Card(
                color: Colors.amber,
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 5.px, horizontal: 10.px),
                  child: Text(_meal.ingredients![index]),
                ),
              );
            }));
  }

  Widget buildMakeSteps(BuildContext context) {
    return buildContentList(
        context: context,
        child: ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            itemBuilder: (ctx, index) {
              return ListTile(
                leading: CircleAvatar(
                  child: Text('#${index + 1}'),
                ),
                title: Text(_meal.steps![index]),
              );
            },
            separatorBuilder: (ctx, index) {
              return const Divider();
            },
            itemCount: _meal.steps?.length ?? 0));
  }

  Widget buildMakeTitle(String title) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.px),
      child: Text(
        title,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22.px),
      ),
    );
  }

  Widget buildContentList(
      {required BuildContext context, required Widget child}) {
    return Container(
        //应该对于自己有的子item来计算自己的高度是多少，此时就需要使用shrinkwrap属性
        //当为false时，就是尽可能占据多的，当为true时则是动态计算高度
        //使用physics可以直接禁止ListView滚动
        //动态计算宽度
        //如果使用column来需要更改MainAxisSize = MainAxisSize.min才能不让column继续延申无限大
        width: MediaQuery.of(context).size.width - 30.px,
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(6.px)),
        child: child);
  }
}
