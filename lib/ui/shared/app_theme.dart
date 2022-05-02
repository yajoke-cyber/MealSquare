import 'package:flutter/material.dart';

class AppTheme {
  // 1.共有属性
  static const double bodyFontSize = 14;
  static const double smallFontSize = 16;
  static const double normalFontSize = 20;
  static const double largeFontSize = 24;

  // 2.普通模式
  static const Color norTextColors = Colors.red;

  static final ThemeData norTheme = ThemeData(
      primarySwatch: Colors.pink,
      //整个应用程序的背景颜色
      canvasColor: const Color.fromRGBO(255, 254, 222, 1),
      textTheme: const TextTheme(
        bodyText1: TextStyle(fontSize: bodyFontSize),
      ));

  // 3.暗黑模式
  static const Color darkTextColors = Colors.green;

  static final ThemeData darkTheme = ThemeData(
      primarySwatch: Colors.grey,
      textTheme: const TextTheme(
          bodyText1:
              TextStyle(fontSize: normalFontSize, color: darkTextColors)));
}
