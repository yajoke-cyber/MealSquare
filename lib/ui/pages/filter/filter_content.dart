import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food/core/extension/int_extension.dart';
import 'package:food/core/store/filter_viewmodel.dart';
import 'package:provider/provider.dart';

class FilterContent extends StatelessWidget {
  const FilterContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [buildTitle(), buildListFilter()],
    );
  }

  Widget buildTitle() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20.px),
      alignment: Alignment.center,
      child: Text(
        '展示你的选择',
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.px),
      ),
    );
  }

  Widget buildListFilter() {
    //这里的shrinkWrap会将ListView的高度压缩，所以这里要使用拓展的高度
    return Expanded(
      child: Consumer<FilterViewModel>(builder: (ctx, filterVM, child) {
        return ListView(
          children: [
            buildListTile(filterVM.isGlutenFree, '无谷蛋白', '无谷蛋白', (value) {
              filterVM.isGlutenFree = value;
            }),
            buildListTile(filterVM.isLactoseFree, '不含乳糖', '不含乳糖', (value) {
              filterVM.isLactoseFree = value;
            }),
            buildListTile(filterVM.isVegetarian, '素食主义', '素食主义', (value) {
              filterVM.isVegetarian = value;
            }),
            buildListTile(filterVM.isVegan, '严格素食主义', '严格素食主义', (value) {
              filterVM.isVegan = value;
            })
          ],
        );
      }),
    );
  }

  Widget buildListTile(
      bool state, String title, String subtitle, Function onChange) {
    return ListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      trailing: Switch(
          value: state,
          onChanged: (value) {
            onChange(value);
          }),
    );
  }
}
