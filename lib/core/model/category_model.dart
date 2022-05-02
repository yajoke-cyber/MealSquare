import 'package:flutter/cupertino.dart';

class CategoryModel {
  String? id = '';
  String? title = '';
  String? color = '';
  //使用一个intColor
  Color? finalColor;
  CategoryModel(this.id, this.title, this.color);

  CategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    color = json['color'];
    finalColor = Color(int.parse(color!, radix: 16) | 0xFF000000);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['color'] = color;
    return data;
  }
}
