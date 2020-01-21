import 'package:flutter/material.dart';

import '../dummy_data.dart';
import '../widgets/meal_item.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = '/category-meals';

  @override
  Widget build(BuildContext context) {
    final routeArgs =
    ModalRoute
        .of(context)
        .settings
        .arguments as Map<String, String>;

    final title = routeArgs['title'];
    final categoryId = routeArgs['id'];

    final meals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView.builder(
        itemBuilder: (context, idx) {
          return MealItem(
            id: meals[idx].id,
            title: meals[idx].title,
            imageUrl: meals[idx].imageUrl,
            affordability: meals[idx].affordability,
            duration: meals[idx].duration,
            complexity: meals[idx].complexity,
          );
        },
        itemCount: meals.length,
      ),
    );
  }
}
