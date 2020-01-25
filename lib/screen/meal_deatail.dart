

import 'package:flutter/material.dart';
import '../dummy_data.dart';

class MealDeatailScreen extends StatelessWidget {
  static const routeName = '/meal-detail';
 
  final Function toggleFavorite; 
  final Function isFavorited;
  MealDeatailScreen(this.toggleFavorite,this.isFavorited,);

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
    final appbar =AppBar(title: Text(selectedMeal.title));
    Widget buildTitle(BuildContext , String title){
      return
       Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              child:
                  Text(title, style: Theme.of(context).textTheme.title),
            );
    }
    Widget buildContainer(Widget child,double size, int height){
      return
      Container(
        
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey,
                ),
                borderRadius: BorderRadius.circular(10)
              ),
              
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.symmetric(vertical: 2),
              height: size* height.toDouble(),
              width: MediaQuery.of(context).size.width - 30,
              child:child,
      );
    }
    return Scaffold(
      appBar:appbar ,
      body: SingleChildScrollView(
              child: Column(
          children: <Widget>[
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
           buildTitle(BuildContext, 'Ingredients'),
            
            buildContainer( ListView.builder(
              physics: const NeverScrollableScrollPhysics(),

                itemBuilder: (ctx, index)=>Card(
                  color:  Theme.of(context).accentColor,
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(selectedMeal.ingredients[index],)),
                ),
                itemCount: selectedMeal.ingredients.length,

              
              ),45,selectedMeal.ingredients.length
            ),
            buildTitle(BuildContext, 'Steps'),
            buildContainer(
              ListView.builder(
                itemBuilder: (ctx , index)=>Column(
                  children: <Widget>[
                    ListTile(
                      leading: CircleAvatar(
                        child: Text('#${index +1}'),

                      ),
                      title: Text(selectedMeal.steps[index]),
                    ),
                    Divider(),
                  ],
                ),
                
                itemCount: selectedMeal.steps.length,
              ),
              60,
              selectedMeal.steps.length
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          
          isFavorited(mealId)?Icons.favorite:Icons.favorite_border,
          color: Colors.red,
          
        ),
        onPressed:()=>toggleFavorite(mealId),
        
      ),
    );
  }
}
