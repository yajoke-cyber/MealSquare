import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:food/core/model/category_model.dart';

class JsonParse {
  //加载json文件

  static Future<List<CategoryModel>> getCategoryData() async {
    //拿到一个字符串，需要转换为对象格式
    final jsonString = await rootBundle.loadString('assets/json/category.json');
    //json解析
    final result = json.decode(jsonString);
    //将Map中的直接转换为对象
    final resultList = result["category"];
    final List<CategoryModel> categories = [];
    for (var json in resultList) {
      categories.add(CategoryModel.fromJson(json));
    }
    return categories;
  }
}
