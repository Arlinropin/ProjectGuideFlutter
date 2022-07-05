import 'package:flutter/material.dart';
import 'package:nav_app/DataBase/dummy_data.dart';
import 'package:nav_app/Models/Meal.dart';
import './Pages/CategoriesMealsScreen/categoriesMealsScreen.dart';
import './Pages/FiltersScreen/filtersScreen.dart';
import './Pages/MealDetailScreen/mealDetailScreen.dart';
import './Pages/TabsScreen/tabsScreen.dart';
import './Theme/theme.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false
  };

  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favoriteMeals = [];

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;
      _availableMeals = DUMMY_MEALS.where((element) {
        if (_filters['gluten'] as bool && !element.isGlutenFree) {
          return false;
        }
        if (_filters['lactose'] as bool && !element.isLactoseFree) {
          return false;
        }
        if (_filters['vegan'] as bool && !element.isVegan) {
          return false;
        }
        if (_filters['vegetarian'] as bool && !element.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void _toggleFavorite(String mealId) {
    final existingIndex =
        _favoriteMeals.indexWhere((element) => element.id == mealId);
    if (existingIndex >= 0) {
      setState(() {
        _favoriteMeals.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favoriteMeals
            .add(DUMMY_MEALS.firstWhere((element) => element.id == mealId));
      });
    }
  }

  bool _isMealFavorite(String id) {
    return _favoriteMeals.any((element) => element.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: ThemeApp.NameApp,
      theme: ThemeApp.data,
      home: TabsScreen(_favoriteMeals),
      initialRoute: '/',
      routes: {
        CategoryMealsScreen.routeName: (context) =>
            CategoryMealsScreen(_availableMeals),
        MealDetailScreen.routeName: (context) =>
            MealDetailScreen(_toggleFavorite, _isMealFavorite),
        FiltersScreen.routeName: (context) =>
            FiltersScreen(_filters, _setFilters)
      },
      // onGenerateRoute: (settings) {
      //   print(settings.arguments);
      //   return MaterialPageRoute(builder: (context) => CategoriesScreen());
      // },
      // onUnknownRoute: ,
    );
  }
}
