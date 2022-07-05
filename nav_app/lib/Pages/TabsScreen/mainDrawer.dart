import 'package:flutter/material.dart';
import 'package:nav_app/Pages/FiltersScreen/filtersScreen.dart';

Widget buildListTile(String title, IconData icon, Function() tapHandler) {
  return ListTile(
    leading: Icon(
      icon,
      size: 26,
    ),
    title: Text(
      title,
      style: const TextStyle(
          fontFamily: 'RobotoCondensed',
          fontSize: 24,
          fontWeight: FontWeight.bold),
    ),
    onTap: tapHandler,
  );
}

void _selectScreen(BuildContext context, String routeName) {
  Navigator.of(context).pushReplacementNamed(routeName);
}

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(children: [
        Container(
          height: 120,
          width: double.infinity,
          alignment: Alignment.centerLeft,
          child: Container(
            padding: const EdgeInsets.all(20),
            color: Colors.blueGrey.shade50,
            width: double.infinity,
            child: Text(
              'Cooking Up!',
              style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 30,
                  color: Theme.of(context).primaryColor),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        buildListTile(
            'Meals', Icons.restaurant, () => _selectScreen(context, '/')),
        buildListTile('Filters', Icons.settings,
            () => _selectScreen(context, FiltersScreen.routeName))
      ]),
    );
  }
}
