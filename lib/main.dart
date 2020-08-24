import 'package:chop_chop_flutter/Pages/RestaurantProfilePage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Pages/CartPage.dart';
import 'Pages/HomePage.dart';
import 'Pages/MealProfilePage.dart';
import 'Theme.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Chop Chop',
      theme: basicTheme(),
      home: HomePage(),
      routes: <String, WidgetBuilder>{
        '/RestaurantProfilePage': (BuildContext context) => RestaurantProfilePage(),
        '/MealProfilePage': (BuildContext context) => MealProfilePage(),
        '/CartPage': (BuildContext context) => CartPage(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}