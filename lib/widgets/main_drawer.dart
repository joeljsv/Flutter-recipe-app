import 'package:flutter/material.dart';
import '../screen/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget drwerList(
      BuildContext context,
      IconData icon,
      String title,
      Function tapHandeler,
    ) {
      return ListTile(
        leading: Icon(
          icon,
          size: 26,
        ),
        title: Text(
          title,
          style: TextStyle(
              fontFamily: 'RobotoCondensed',
              fontSize: 24,
              fontWeight: FontWeight.bold),
        ),
        onTap:tapHandeler);}
            
          
      
 

    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            color: Theme.of(context).primaryColor,
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            child: Text(
              'Cooking Up',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 30,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          drwerList(
            context,
            Icons.restaurant,
            'Meals',(){
            Navigator.of(context).pushReplacementNamed('/');}
          ),
          drwerList(
            context,
            Icons.filter_list,
            'Filters',(){
              Navigator.of(context).pushReplacementNamed(FilterScreen.routeNmae);
            }
          ),
        ],
      ),
    );
  }
}
