import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../../../core/store/favor_viewmodel.dart';
import '../../widgets/meal_item.dart';

class FavorContent extends StatelessWidget {
  const FavorContent({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    //这里直接使用Selector来根据条件渲染列表
    return Consumer<FavorViewModel>(
      builder: (ctx, favorVM, child) {
        if (favorVM.favorMeals.isEmpty) {
          return const Center(
            child: Text('你没有收藏的美食哦~'),
          );
        }
        return ListView.builder(
            itemCount: favorVM.favorMeals.length,
            itemBuilder: (ctx, index) {
              return MealItem(favorVM.favorMeals[index]);
            });
      },
    );
  }
}
