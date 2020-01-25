import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';
import '../widgets/meal_item.dart';

class FavoriteScreen extends StatelessWidget {
  final  List<Meal> favoritesMeals;
  FavoriteScreen(this.favoritesMeals);
  @override
  Widget build(BuildContext context) {
    if(favoritesMeals.isEmpty){
    return Center(
      child: Text(
        'You have no favorites yet!\n\t\t\t\t\t\tStart adding some ',
        style: Theme.of(context).textTheme.title,
      ),
    );}
    else{
      return
       ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(
              id: favoritesMeals[index].id,
              title: favoritesMeals[index].title,
              imageUrl: favoritesMeals[index].imageUrl,
              affordability: favoritesMeals[index].affordability,
              complexity: favoritesMeals[index].complexity,
              duration: favoritesMeals[index].duration,
             removeItem: null,
            );
          },
          itemCount: favoritesMeals.length,
        );
    }
  }
}
