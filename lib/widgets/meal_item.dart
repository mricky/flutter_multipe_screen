import 'package:flutter/material.dart';
import 'package:flutter_multipe_screen/screens/meal_detail.dart';

import '../models/meal.dart';
import '../screens/meal_detail.dart';
class MealItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
 
  MealItem({
    @required this.id,
    @required this.title,
    @required this.imageUrl,
    @required this.affordability,
    @required this.complexity,
    @required this.duration,
   
  });
  String get complexityText{
    // if(complexity == Complexity.Simple){
    //   return 'Simple';
    // }
    // if(complexity == Complexity.Challenging){
    //   return 'Challenging';
    // }
    // if(complexity == Complexity.Hard){
    //   return 'Hard';
    // }
    switch(complexity){
      case Complexity.Simple:
        return 'Simple';
        break;
      case Complexity.Challenging:
        return 'Challenging';
        break;
      case Complexity.Hard:
        return 'Hard';
        break;
      default:
        return 'Unkown';
    }
  }
  String get affordabilityText{
     switch(affordability){
      case Affordability.Affordable:
        return 'Affordable';
        break;
      case Affordability.Luxurious:
        return 'Luxurious';
        break;
      case Affordability.Pricey:
        return 'Pricey';
        break;
      default:
        return 'Unkown';
    }
  }
  void selectMeal(BuildContext context){
      Navigator.of(context).pushNamed(
        MealDetailScreen.routeName,
        arguments: id,
        ).then((result){
          if(result != null){
          
          }
        });
  }
  @override
  Widget build(BuildContext context) {
   return InkWell(onTap: () => selectMeal(context),
   child: Card(
     shape: RoundedRectangleBorder(
       borderRadius: BorderRadius.circular(15)
       ),
       elevation: 4,
       margin: EdgeInsets.all(10),
       child: Column(
         children: <Widget>[
           Stack(children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15)
              ),
              child: Image.network(
                imageUrl, 
                height: 250,
                width: double.infinity,
                fit: BoxFit.cover
                ),
              ),
              Positioned(
                  bottom: 20,
                  right: 10,
                  child: Container(
                    width: 250,
                    color: Colors.black54,
                    padding: EdgeInsets.symmetric(
                      vertical: 5, horizontal: 20,
                      ),
                    child: Text(
                        title,
                        style: TextStyle(
                          fontSize: 26,
                          color: Colors.white),
                          softWrap: true,
                          overflow: TextOverflow.fade,
                        ),
                  ),
              ),
                
           ],
           ),
           Padding(
             padding: const EdgeInsets.all(20),
             child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceAround,
               children: <Widget>[
                 Row(children: <Widget>[
                    Icon(Icons.schedule,),
                    SizedBox(width: 6,),
                    Text('$duration min')

                 ],),
                  Row(children: <Widget>[
                    Icon(Icons.work,),
                    SizedBox(width: 6,),
                    Text('$complexityText min')

                 ],),
                 Row(children: <Widget>[
                    Icon(Icons.attach_money,),
                    SizedBox(width: 6,),
                    Text('$affordabilityText min')

                 ],),
               ],
             ),
           )
         ],
       ),
    ),
   );
  }
}