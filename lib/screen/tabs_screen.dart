import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';
import '../widgets/main_drawer.dart';
import './categories_screen.dart';
import './Favorites_Screen.dart';

class TabScreen extends StatefulWidget {
  final List<Meal>favoriteMeals;
  TabScreen(this.favoriteMeals);
  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  List<Map<String,Object>> _pages ;
  int _selectedPageIndex = 0;
  @override
  void initState() {
     _pages = 
    [
    {'page':CategoriesScreen(),'title':'Categories'},
    {'page':FavoriteScreen(widget.favoriteMeals),'title':'Favorites'}
  ];
    super.initState();
  }
  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _pages[_selectedPageIndex]['title']
        ),
      ),
      drawer: MainDrawer(),
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: _selectedPageIndex,
        type: BottomNavigationBarType.shifting,
      
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(
              Icons.category,
              
            ),
            title: Text(
              'Categories',
            ),
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(
              Icons.star,
              
            ),
            title: Text(
              'Favorites',
            ),
          ),
        ],
      ),
    );
  }
}
