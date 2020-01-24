import 'package:flutter/material.dart';

import '../widgets/drawer.dart';

class FiltersScreen extends StatelessWidget {
  static const routeName = '/filters';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
      ),
      body: Center(
        child: Text('filters'),
      ),
      drawer: MainDrawer(),
    );
  }
}
