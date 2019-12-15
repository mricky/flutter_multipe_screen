import 'package:flutter/material.dart';
import 'package:flutter_multipe_screen/widgets/meal_item.dart';
import '../dummy_data.dart';
import '../widgets/meal_item.dart';
import '../models/meal.dart';
class CatergoryMealsScreen extends StatefulWidget {
  // final String categoryId;
  // final String categoryTitle;

  // CatergoryMealsScreen(this.categoryId, this.categoryTitle);

  
  @override
  _CatergoryMealsScreenState createState() => _CatergoryMealsScreenState();
}

class _CatergoryMealsScreenState extends State<CatergoryMealsScreen> {
  String categoryTitle;
  List<Meal> displayMeals;
  var _loadedInitData = false;
  @override
  void initState() {
       
      super.initState();
  }
  @override
  void didChangeDependencies() {
   
    if(!_loadedInitData){
          final routeArgs =
         ModalRoute.of(context).settings.arguments as Map<String,String>;
        categoryTitle = routeArgs['title'];
        final categoryId = routeArgs['id'];
        displayMeals = DUMMY_MEALS.where((meal){
          return meal.categories.contains(categoryId);

        }).toList();
        _loadedInitData = true;
    }
    super.didChangeDependencies();
  }
  void _removeMeal(String mealId){
      setState(() {
        displayMeals.removeWhere((meal) => meal.id == mealId);
      });
  }
  @override
  Widget build(BuildContext context) {
   

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
          itemBuilder: (ctx, index){
              return MealItem(
                  id: displayMeals[index].id,
                  title: displayMeals[index].title,
                  imageUrl: displayMeals[index].imageUrl,
                  duration: displayMeals[index].duration,
                  affordability: displayMeals[index].affordability,
                  complexity: displayMeals[index].complexity,
                  remoteItem: _removeMeal,

              );
          }, itemCount: displayMeals.length,
      ),
    );
  }
}