import 'package:flutter/material.dart';
import 'package:food/ui/pages/home/home_appbar.dart';

import 'home_content.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(context),
      body: const Center(child: HomeScreenContent()),
    );
  }
}
