import 'package:flutter/material.dart';
import 'package:flutter_multipe_screen/categories_screen.dart';
import './categories_screen.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     return MaterialApp(
       title: 'DetailMeal',
       theme: ThemeData(
         primarySwatch: Colors.blue
       ),
       home: CategoriesScreen(),
     );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DeliMeal'),
        ),
      body: Center(
        child: Text('Navigation Times'),
      ),
    );
  }
}