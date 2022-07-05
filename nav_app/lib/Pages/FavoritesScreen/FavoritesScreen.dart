import 'package:flutter/material.dart';

import '../../Models/Meal.dart';
import '../CategoriesMealsScreen/mealItem.dart';

class FavoritesScreen extends StatelessWidget {
  List<Meal> favoriteMeals;
  FavoritesScreen(this.favoriteMeals);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: (favoriteMeals.isEmpty)
            ? const Center(
                child: Text(
                  'You have no favorites yet\nStart adding some!',
                  textAlign: TextAlign.center,
                ),
              )
            : ListView.builder(
                itemBuilder: (context, index) {
                  return MealItem(meal: favoriteMeals[index]);
                },
                itemCount: favoriteMeals.length,
              ));
  }
}
