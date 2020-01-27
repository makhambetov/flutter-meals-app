import 'package:flutter/material.dart';

import '../widgets/drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';
  Function setFilters;

  final Map<String, bool> filters;

  FiltersScreen(this.filters, this.setFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFree = false;
  var _lactoseFree = false;
  var _vegetarian = false;
  var _vegan = false;

  @override
  initState() {
    super.initState();
    _glutenFree = widget.filters['glutan'];
    _lactoseFree = widget.filters['lactose'];
    _vegan = widget.filters['vegan'];
    _vegetarian = widget.filters['vegetarian'];
  }

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
      drawer: MainDrawer(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.save),
        onPressed: () {
          final selectedFilters = {
            'glutan': _glutenFree,
            'lactose': _lactoseFree,
            'vegetarian': _vegetarian,
            'vegan': _vegan,
          };

          widget.setFilters(selectedFilters);

          Navigator.pushReplacementNamed(context, '/');
        },
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
                  _vegetarian,
                  'Vegetarian',
                  'Only vegetarian meals',
                  (bool newVal) {
                    setState(() {
                      _vegetarian = newVal;
                    });
                  },
                ),
                _buildSwitchItem(
                  _vegan,
                  'isVegan',
                  'Only vegan meals',
                  (bool newVal) {
                    setState(() {
                      _vegan = newVal;
                    });
                  },
                ),
                _buildSwitchItem(
                  _glutenFree,
                  'Gluten free',
                  'Only gluten free meals',
                  (bool newVal) {
                    setState(() {
                      _glutenFree = newVal;
                    });
                  },
                ),
                _buildSwitchItem(
                  _lactoseFree,
                  'Lactose free',
                  'Only Lactose free meals',
                  (bool newVal) {
                    setState(() {
                      _lactoseFree = newVal;
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
