import 'package:flutter/material.dart';
import 'package:nav_app/DataBase/dummy_data.dart';
import 'package:nav_app/Pages/AppBar/appBar.dart';
import 'package:nav_app/Pages/CategoriesScreen/categoryItem.dart';

import '../../Theme/theme.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView(
          padding: const EdgeInsets.all(20),
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 3 / 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20),
          children: DUMMY_CATEGORIES
              .map((category) => CategoryItem(category))
              .toList()),
    );
  }
}
