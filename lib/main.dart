import 'package:flutter/material.dart';
import './dummy_data.dart';
import './screens/tabs_screen.dart';
import './screens/category_meals_screen.dart';
import './screens/categories_screen.dart';
import './screens/meal_detail.dart';
import './screens/filters_screen.dart';
import './models/meal.dart';
void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
      'gluten': false,
      'lactose': false,
      'vegan': false,
      'vegetarian': false,
  };
  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favoriteMeals = [];
  void _setFilters(Map<String, bool> filterData){
     setState(() {
       _filters = filterData;

       _availableMeals = DUMMY_MEALS.where((meal){
         // ...
          if(_filters['gluten'] && !meal.isGlutenFree){
              return false;
          }
          if(_filters['lactose'] && !meal.isLactoseFree){
              return false;
          }
          if(_filters['vegan'] && !meal.isVegan){
              return false;
          }
          if(_filters['vegetarian'] && !meal.isVegetarian){
              return false;
          }
          return true;
       }).toList();
     });
  }

  void _toogleFavorite(String mealId){
    final existingIndex = 
     _favoriteMeals.indexWhere((meal) => meal.id == mealId);
    if(existingIndex >=0){
      setState(() {
        _favoriteMeals.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favoriteMeals.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId),
        );
      });
    }
  }
  bool _isMealFavorite(String id){
    return _favoriteMeals.any((meal) => meal.id == id);

  }
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
      // home: CategoriesScreen(),
       initialRoute: '/',
       routes: {
         '/': (ctx) => TabsScreen(_favoriteMeals),
         // cara 1
         //'/category-meals': (context) => CatergoryMealsScreen(),
         // cara 2
         CatergoryMealsScreen.routeName: (context) => CatergoryMealsScreen(_availableMeals),
         MealDetailScreen.routeName: (context) => MealDetailScreen(_toogleFavorite,_isMealFavorite),
         FiltersScreen.routeName: (context) => FiltersScreen(_filters,_setFilters)
       },
       
       // execute for any unregistered named route
      //  onGenerateRoute: (settings){
      //    print(settings.arguments);
      //    return MaterialPageRoute(builder: (ctx) => CategoriesScreen());
      //  },
      // hampir sama dengan onGenerateRoute
      // isn't define or doesn't return a valid navigation action
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