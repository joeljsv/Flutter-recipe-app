import 'package:flutter/material.dart';
import './dummy_data.dart';
import 'package:meal_app/models/meal.dart';
import './screen/filters_screen.dart';
import './screen/meal_deatail.dart';
import './screen/tabs_screen.dart';
import './screen/category_meals_screen.dart';
import './models/meal.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

Map<String, bool> _filters={
  'gluten':false,
  'lactose':false,
  'vegan':false,
  'vegetarian':false,


};

List<Meal>_avilableMeals= DUMMY_MEALS;
List<Meal>_favoritedMeals=[];

void _setFilters(Map<String,bool> filterdDAta)
{
  setState(() {
    _filters= filterdDAta;
    _avilableMeals=DUMMY_MEALS.where((meal){
      if(_filters['gluten']&& !meal.isGlutenFree){
        return false;
      }
       if(_filters['lactose']&& !meal.isLactoseFree){
        return false;
      }
       if(_filters['vegan']&& !meal.isVegan){
        return false;
      }
       if(_filters['vegetarian']&& !meal.isVegetarian){
        return false;
      }
      return true;

    }).toList();
  });
}
void _toggleFavorite(String mealId){
  print('favorited');
  final exixstingIndex= _favoritedMeals.indexWhere((meal)=> meal.id== mealId);
  if(exixstingIndex>=0){
    setState(() {
      _favoritedMeals.removeAt(exixstingIndex);
    });
    

    }else{
      _favoritedMeals.add(DUMMY_MEALS.firstWhere((meal)=>meal.id==mealId));
    
  }
 
  }
  
  
  bool _isMealFavorite(String id){
    return _favoritedMeals.any((meal)=>meal.id==id);}

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
            body1: TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            body2: TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            title: TextStyle(
              fontSize: 20,
              fontFamily: 'RobotoCondensed',
              fontWeight: FontWeight.bold,
            )),
      ),
      // home: CategoriesScreen(),
      initialRoute: '/', // default is '/'
      routes: {
        '/': (ctx) =>TabScreen(_favoritedMeals),
        CategoryMealsScreen.routeName: (ctx) => CategoryMealsScreen(_avilableMeals),
        MealDeatailScreen.routeName: (ctx)=> MealDeatailScreen(_toggleFavorite,_isMealFavorite),
        FilterScreen.routeNmae: (ctx)=> FilterScreen(_filters, _setFilters),
      },
    );
  }
}
