import 'package:flutter/material.dart';
import 'package:flutter_multipe_screen/dummy_data.dart';


import '../widgets/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('DeliMeal'),
      // ),
      body: GridView(
      padding: EdgeInsets.all(25),
      children: DUMMY_CATEGORIES.map((
        catData) => CategoryItem(
          catData.id,
          catData.title, 
          catData.color)
       ).toList(),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20
      ),
    ),
    ); 
  }
}