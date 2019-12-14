import 'package:flutter/material.dart';
import 'package:flutter_multipe_screen/screens/categories_screen.dart';
import 'package:flutter_multipe_screen/screens/favorites_screen.dart';
import './categories_screen.dart';
class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        // initialIndex: 1,
        child: Scaffold(
          appBar: AppBar(title: Text('Meals'),
          bottom: TabBar(

            tabs: <Widget>[
            Tab(
              icon: Icon(Icons.category), 
              text: 'Catgories',
            ),
            Tab(
              icon: Icon(Icons.star),
              text: 'Favorites',
            ),
          ],
          ),
          ),
          body: TabBarView(
            children: <Widget>[
              CategoriesScreen(),
              FavoritesScreen()
            ],
          ),
        ),
      
    );
  }
}