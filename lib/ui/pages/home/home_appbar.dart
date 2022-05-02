import 'package:flutter/material.dart';

class HomeAppBar extends AppBar {
  //盗用AppBar的构造函数，相当于直接使用AppBar来构造
  HomeAppBar(BuildContext context, {Key? key})
      : super(
          key: key,
          title: const Text('美食广场'),
          leading: Builder(
            builder: (ctx) {
              //自定义抽屉button图标，此时可以使用builder去element树中寻找对象实例，因为of都是向上查找的
              return IconButton(
                  onPressed: () {
                    Scaffold.of(ctx).openDrawer();
                  },
                  icon: const Icon(Icons.build));
            },
          ),
        );
}
