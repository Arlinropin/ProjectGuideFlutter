import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:nav_app/Models/categoryMeal.dart';
import 'package:nav_app/Pages/CategoriesMealsScreen/categoriesMealsScreen.dart';

class CategoryItem extends StatelessWidget {
  final CategoryMeal category;

  CategoryItem(this.category);

  void selectCategory(BuildContext context) {
    Navigator.of(context).pushNamed(CategoryMealsScreen.routeName, arguments: {
      CategoryMealsScreenArguments.category.toString(): category
    });
    // Navigator.of(context).push(MaterialPageRoute(builder: (_) {
    //   return CategoryMealsScreen(category);
    // }));
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [category.color.withOpacity(0.7), category.color],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight),
            borderRadius: BorderRadius.circular(10)),
        child: Text(
          category.title,
          style: Theme.of(context).textTheme.headline3,
        ),
      ),
    );
  }
}

class Navigation {}
