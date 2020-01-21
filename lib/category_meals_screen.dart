import 'package:flutter/material.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const route = '/category-meals';

  @override
  Widget build(BuildContext context) {

    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;

    final title = routeArgs['title'];
    final id = routeArgs['id'];

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Text('New page!'),
      ),
    );
  }
}
