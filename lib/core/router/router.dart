import 'package:flutter/material.dart';
import 'package:food/ui/pages/detail/detail.dart';
import 'package:food/ui/pages/main/main.dart';
import 'package:food/ui/pages/meals/meal.dart';

import '../../ui/pages/filter/filter.dart';

class RouterConfig {
  static const String initialRoute = MainScreen.routeName;
  static final Map<String, WidgetBuilder> routes = {
    MainScreen.routeName: (ctx) => const MainScreen(),
    MealScreen.routeName: (ctx) => const MealScreen(),
    DetailScreen.routeName: (ctx) => const DetailScreen(),
    FilterScreen.routeName: (ctx) => const FilterScreen(),
  };
  // 自己扩展
  static final RouteFactory generateRoute = (settings) {
    return null;
  };

  static final RouteFactory unknownRoute = (settings) {
    return null;
  };
}
