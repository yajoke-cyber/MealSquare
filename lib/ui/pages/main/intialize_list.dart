import 'package:flutter/material.dart';
import 'package:food/ui/pages/favor/favor.dart';
import 'package:food/ui/pages/home/home.dart';

final List<Widget> pages = [const HomeScreen(), const FavorScreen()];
final List<BottomNavigationBarItem> items = [
  const BottomNavigationBarItem(label: '首页', icon: Icon(Icons.home)),
  const BottomNavigationBarItem(label: '收藏', icon: Icon(Icons.star))
];
//final定义的数组相当于纯数据
