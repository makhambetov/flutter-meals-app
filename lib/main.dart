import 'package:flutter/material.dart';

import './screens/category_meals_screen.dart';
import './screens/meal_detail_screen.dart';
import './screens/tabs.dart';
import './screens/filters_screen.dart';
import './models/meal.dart';
import './dummy_data.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'glutan': false,
    'lactose': false,
    'vegetarian': false,
    'vegan': false,
  };

  List<Meal> _filteredMeals = DUMMY_MEALS;

  void _setFilters(Map<String, bool> filteredData) {
    setState(() {
      _filters = filteredData;

      _filteredMeals = DUMMY_MEALS.where((meal) {
        if (!meal.isGlutenFree && _filters['glutan']) {
          return false;
        }

        if (!meal.isLactoseFree && _filters['lactose']) {
          return false;
        }

        if (!meal.isVegan && _filters['vegan']) {
          return false;
        }

        if (!meal.isVegetarian && _filters['vegetarian']) {
          return false;
        }

        return true;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meals App',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              body1: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              body2: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              title: TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
              ),
            ),
      ),
      home: TabsScreen(),
      routes: {
        CategoryMealsScreen.routeName: (ctx) =>
            CategoryMealsScreen(_filteredMeals),
        MealDetail.routeName: (ctx) => MealDetail(),
        FiltersScreen.routeName: (ctx) => FiltersScreen(_filters, _setFilters),
      },
    );
  }
}
