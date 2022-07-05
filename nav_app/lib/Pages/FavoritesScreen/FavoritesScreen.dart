import 'package:flutter/material.dart';

import '../../Models/Meal.dart';
import '../CategoriesMealsScreen/mealItem.dart';

class FavoritesScreen extends StatefulWidget {
  List<Meal> favoriteMeals;
  FavoritesScreen(this.favoriteMeals);

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: (widget.favoriteMeals.isEmpty)
            ? const Center(
                child: Text(
                  'You have no favorites yet\nStart adding some!',
                  textAlign: TextAlign.center,
                ),
              )
            : ListView.builder(
                itemBuilder: (context, index) {
                  return MealItem(meal: widget.favoriteMeals[index]);
                },
                itemCount: widget.favoriteMeals.length,
              ));
  }
}
