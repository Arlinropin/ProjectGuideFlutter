import 'package:flutter/material.dart';

import '../TabsScreen/mainDrawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';
  final Function saveFilters;
  final Map<String, bool> currentFilters;
  FiltersScreen(this.currentFilters, this.saveFilters);
  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _isGlutenFree = false;
  bool _isLactoseFree = false;
  bool _isVegan = false;
  bool _isVegetarian = false;
  @override
  void initState() {
    _isGlutenFree = widget.currentFilters['gluten'] as bool;
    _isLactoseFree = widget.currentFilters['lactose'] as bool;
    _isVegan = widget.currentFilters['vegan'] as bool;
    _isVegetarian = widget.currentFilters['vegetarian'] as bool;
    super.initState();
  }

  Widget _buildSwitchListTile(
      {required String title,
      required String subtitle,
      required bool value,
      required Function(bool) updateValue}) {
    return SwitchListTile(
      title: Text(title),
      value: value,
      subtitle: Text(subtitle),
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
        actions: [
          IconButton(
              onPressed: () {
                final selectedFilters = {
                  'gluten': _isGlutenFree,
                  'lactose': _isLactoseFree,
                  'vegan': _isVegan,
                  'vegetarian': _isVegetarian
                };
                widget.saveFilters(selectedFilters);
              },
              icon: Icon(Icons.save))
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selection.',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          Expanded(
              child: ListView(
            children: [
              _buildSwitchListTile(
                  title: 'Gluten-free',
                  subtitle: 'Only include gluten-free meals',
                  value: _isGlutenFree,
                  updateValue: (newValue) {
                    setState(() {
                      _isGlutenFree = newValue;
                    });
                  }),
              _buildSwitchListTile(
                  title: 'Lactose-free',
                  subtitle: 'Only include lactosa-free meals',
                  value: _isLactoseFree,
                  updateValue: (newValue) {
                    setState(() {
                      _isLactoseFree = newValue;
                    });
                  }),
              _buildSwitchListTile(
                  title: 'Vegan',
                  subtitle: 'Only include vegan meals',
                  value: _isVegan,
                  updateValue: (newValue) {
                    setState(() {
                      _isVegan = newValue;
                    });
                  }),
              _buildSwitchListTile(
                  title: 'Vegetarian',
                  subtitle: 'Only include vegetarian meals',
                  value: _isVegetarian,
                  updateValue: (newValue) {
                    setState(() {
                      _isVegetarian = newValue;
                    });
                  })
            ],
          ))
        ],
      ),
    );
  }
}
