import 'package:flutter/material.dart';
import 'package:nav_app/Pages/AppBar/appBar.dart';
import 'package:nav_app/Pages/CategoriesScreen/categoriesScreen.dart';
import 'package:nav_app/Pages/TabsScreen/mainDrawer.dart';

import '../../Models/Meal.dart';
import '../FavoritesScreen/FavoritesScreen.dart';

class TabsScreen extends StatefulWidget {
  List<Meal> favoriteMeals;
  TabsScreen(this.favoriteMeals);
  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  // final List<Tab> tabsTop = [
  //   const Tab(
  //     icon: Icon(Icons.category),
  //     text: 'Categories',
  //   ),
  //   const Tab(
  //     icon: Icon(Icons.star),
  //     text: 'Favorites',
  //   )
  // ];
  List<Map<String, Object>> _pages = [];
  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  // TabBarView buildTab() {
  //   return TabBarView(
  //     children: _pages,
  //   );
  // }

  // Widget buildDefaultTabController({required Widget child}) {
  //   return DefaultTabController(length: 2, child: child);
  // }
  @override
  void initState() {
    _pages = [
      {'page': CategoriesScreen(), 'title': 'Categories'},
      {'page': FavoritesScreen(widget.favoriteMeals), 'title': 'Favorites'}
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(_pages[_selectedPageIndex]['title'] as String),
          // bottom: TabBar(indicatorColor: Colors.black, tabs: tabsTop),
        ),
        drawer: MainDrawer(),
        body: _pages[_selectedPageIndex]['page'] as Widget,
        bottomNavigationBar: BottomNavigationBar(
            onTap: _selectPage,
            backgroundColor: Colors.blueGrey.shade50,
            unselectedItemColor: Colors.grey,
            selectedItemColor: Theme.of(context).primaryColor,
            currentIndex: _selectedPageIndex,
            type: BottomNavigationBarType.shifting,
            items: const [
              BottomNavigationBarItem(
                  backgroundColor: Colors.white,
                  icon: Icon(Icons.category),
                  label: 'Categories'),
              BottomNavigationBarItem(
                  backgroundColor: Colors.white,
                  icon: Icon(Icons.star),
                  label: 'Favorites'),
            ]));
  }
}
