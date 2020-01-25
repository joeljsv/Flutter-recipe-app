import 'package:flutter/material.dart';
import '../widgets/meal_item.dart';
import '../dummy_data.dart';
import '../models/meal.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = '/category-meals';
  final List<Meal> avilableMeals;
  CategoryMealsScreen(this.avilableMeals);
  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
String categorieTitle;
List<Meal> displayMeal;

var _lodedData= false;
@override

void initState(){

  super.initState();
}
@override
  void didChangeDependencies() {
    if (!_lodedData){
 final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
  categorieTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];
    displayMeal = widget.avilableMeals.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();
    _lodedData= true;
    }
   
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }
void _removeMeal(String mealId){
  setState(() {
    displayMeal.retainWhere((meal)=>meal.id == mealId);
  });
    
  }

  
  Widget build(BuildContext context) {
    
    return Scaffold(
        appBar: AppBar(
          title: Text(categorieTitle),
        ),
        body: ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(
              id: displayMeal[index].id,
              title: displayMeal[index].title,
              imageUrl: displayMeal[index].imageUrl,
              affordability: displayMeal[index].affordability,
              complexity: displayMeal[index].complexity,
              duration: displayMeal[index].duration,
             removeItem:  _removeMeal
            );
          },
          itemCount: displayMeal.length,
        ),
        );
  }
}
