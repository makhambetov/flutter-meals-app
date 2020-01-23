import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            height: 150,
            width: double.infinity,
            color: Theme.of(context).accentColor,
            alignment: Alignment.centerLeft,
            child: Text(
              'Cooking up!',
              style: TextStyle(
                fontFamily: 'RaleWay',
                fontSize: 30,
                fontWeight: FontWeight.w900,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          SizedBox(height: 20),
          _buildListItem(
            'Meals',
            Icons.restaurant,
            () => Navigator.pushNamed(context, '/'),
          ),
          _buildListItem(
            'Filters',
            Icons.filter,
            () => Navigator.pushNamed(context, '/filters'),
          ),
        ],
      ),
    );
  }

  Widget _buildListItem(String title, IconData icon, Function tapHandler) {
    return ListTile(
      leading: Icon(icon, size: 25),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 25,
          fontFamily: 'RobotoCondensed',
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: tapHandler,
    );
  }
}
