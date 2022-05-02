import 'package:flutter/material.dart';

import 'filter_content.dart';

class FilterScreen extends StatelessWidget {
  static const String routeName = "/filter";
  const FilterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('美食筛选')), body: const FilterContent());
  }
}
