import 'package:flutter/material.dart';
import 'package:food/core/store/favor_viewmodel.dart';
import 'package:food/core/store/meal_viewmodel.dart';
import 'package:food/ui/pages/main/main.dart';
import 'package:food/ui/shared/app_theme.dart';
import 'package:food/ui/shared/size_fit.dart';
import 'package:provider/provider.dart';

import 'core/router/router.dart';

void main() {
  SizeFit.initialize();

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (ctx) => MealViewModel()),
      ChangeNotifierProvider(create: (ctx) => FavorViewModel()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '美食广场',
      theme: AppTheme.norTheme,
      home: const MainScreen(),
      routes: RouterConfig.routes,
      //未知路由跳转页面
      onUnknownRoute: RouterConfig.unknownRoute,
      //动态路由配置
      onGenerateRoute: RouterConfig.generateRoute,
    );
  }
}
