import 'package:flutter/material.dart';
import './screens/category_meals_screen.dart';
import './screens/categories_screen.dart';
import './screens/meal_detail.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     return MaterialApp(
       title: 'DetailMeal',
       theme: ThemeData(
         primarySwatch: Colors.blue,
         accentColor: Colors.amber,
         canvasColor: Color.fromRGBO(255, 254, 229, 1),
         fontFamily: 'RobotoCondensed',
         textTheme: ThemeData.light().textTheme.copyWith(
           body1: TextStyle(
             color: Color.fromRGBO(20, 51, 51, 1),
           ),
           body2: TextStyle(
             color: Color.fromRGBO(20, 51, 51, 1),
           ),
           title: TextStyle(
             fontSize: 24,
             fontFamily: 'RobotoCondensed')
         )
       ),
       home: CategoriesScreen(),
       initialRoute: '/',
       routes: {
         // cara 1
         '/category-meals': (context) => CatergoryMealsScreen(),
         // cara 2
        // MealDetailScreen.routeName: (context) => MealDetailScreen()
       },
       // cara ini digunakan jika route name tidak terdaftar, dan dipanggil di scren lain
       // dengan onGenerateRoute akan di arahkan ke sample Categories Screen 
      //  onGenerateRoute: (settings){
      //    print(settings.arguments);
      //    return MaterialPageRoute(builder: (ctx) => CategoriesScreen());
      //  },
       // hampir sama dengan onGenerateRoute
       onUnknownRoute: (settings){
         print(settings.arguments);
         return MaterialPageRoute(builder: (ctx) => CategoriesScreen());
       },
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