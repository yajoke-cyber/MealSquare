import 'package:flutter/material.dart';
import 'package:food/core/extension/int_extension.dart';
import 'package:food/ui/pages/filter/filter.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          buildHeaderView(),
          buildListTile(const Icon(Icons.restaurant), "进餐", () {
            Navigator.of(context).pop();
          }),
          buildListTile(const Icon(Icons.settings), "设置", () {
            Navigator.of(context).pushNamed(FilterScreen.routeName);
          })
        ],
      ),
    );
  }

  Widget buildHeaderView() {
    return Container(
      width: double.infinity,
      height: 100.px,
      alignment: Alignment.center,
      color: Colors.orange,
      child: Text(
        '开始动手',
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26.px),
      ),
    );
  }

  Widget buildListTile(Widget icon, String text, Function handler) {
    return ListTile(
      leading: icon,
      title: Text(
        text,
        style: TextStyle(fontSize: 16.px),
      ),
      onTap: () {
        handler();
      },
    );
  }
}
