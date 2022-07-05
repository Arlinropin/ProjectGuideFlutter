import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:nav_app/Pages/AppBar/appBar.dart';
import 'package:nav_app/Pages/CategoriesMealsScreen/mealItem.dart';
import '../../DataBase/dummy_data.dart';
import '../../Models/Meal.dart';
import '../../Models/categoryMeal.dart';

enum CategoryMealsScreenArguments { category }

class CategoryMealsScreen extends StatefulWidget {
  static String routeName = '/categories-meals';
  final List<Meal> availableMeals;
  CategoryMealsScreen(this.availableMeals);

  @override
  State<CategoryMealsScreen> createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  late final CategoryMeal category;
  List<Meal> displayedMeals = [];
  var _loadedInitData = false;

  @override
  void didChangeDependencies() {
    if (!_loadedInitData) {
      final routeArguments =
          ModalRoute.of(context)?.settings.arguments as Map<String, Object>;
      category =
          routeArguments[CategoryMealsScreenArguments.category.toString()]
              as CategoryMeal;
      displayedMeals = widget.availableMeals.where((meal) {
        return meal.categories.contains(category.id);
      }).toList();
      _loadedInitData = true;
    }
    super.didChangeDependencies();
  }

  void _removeMeal(String mealId) {
    setState(() {
      displayedMeals.removeWhere((element) => element.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Bars.appBar('The recipes: ${category.title} Food'),
      body: Center(
        child: ListView.builder(
          itemBuilder: (context, index) {
            return MealItem(meal: displayedMeals[index]);
          },
          itemCount: displayedMeals.length,
        ),
      ),
    );
  }
}
