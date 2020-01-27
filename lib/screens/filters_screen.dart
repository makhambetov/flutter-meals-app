import 'package:flutter/material.dart';

import '../widgets/drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _isGlutenFree = false;
  var _isLactoseFree = false;
  var _isVegetarian = false;
  var _isVegan = false;

  Widget _buildSwitchItem(
      bool value, String title, String subtitle, Function handler) {
    return SwitchListTile(
      value: value,
      onChanged: handler,
      title: Text(title),
      subtitle: Text(subtitle),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Please select',
              style: Theme.of(context).textTheme.title,
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                _buildSwitchItem(
                  _isVegetarian,
                  'Vegetarian',
                  'Only vegetarian meals',
                  (bool newVal) {
                    setState(() {
                      _isVegetarian = newVal;
                    });
                  },
                ),
                _buildSwitchItem(
                  _isVegan,
                  'isVegan',
                  'Only vegan meals',
                      (bool newVal) {
                    setState(() {
                      _isVegan = newVal;
                    });
                  },
                ),
                _buildSwitchItem(
                  _isGlutenFree,
                  'Gluten free',
                  'Only gluten free meals',
                      (bool newVal) {
                    setState(() {
                      _isGlutenFree = newVal;
                    });
                  },
                ),
                _buildSwitchItem(
                  _isLactoseFree,
                  'Lactose free',
                  'Only Lactose free meals',
                      (bool newVal) {
                    setState(() {
                      _isLactoseFree = newVal;
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
      drawer: MainDrawer(),
    );
  }
}
