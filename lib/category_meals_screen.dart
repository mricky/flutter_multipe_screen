import 'package:flutter/material.dart';

class CatergoryMealsScreen extends StatelessWidget {
  // final String categoryId;
  // final String categoryTitle;

  // CatergoryMealsScreen(this.categoryId, this.categoryTitle);

  
  @override
  Widget build(BuildContext context) {
    final routeArgs = ModalRoute.of(context).settings.arguments as Map<String,String>;
    final categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];
    
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: Center(
        child: Text('The Recipts For The Category'
       ),
      ),
    );
  }
}