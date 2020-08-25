import 'package:chop_chop_flutter/Pages/restaurant_profile_page.dart';
import 'package:chop_chop_flutter/providers/cart_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Pages/cart_page.dart';
import 'Pages/home_page.dart';
import 'Pages/meal_profile_page.dart';
import 'Theme.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider(
      create: (BuildContext context) { return CartProvider(); },
      child: MaterialApp(
        title: 'Chop Chop',
        theme: basicTheme(),
        home: HomePage(),
        routes: <String, WidgetBuilder>{
          '/RestaurantProfilePage': (BuildContext context) => RestaurantProfilePage(),
          '/MealProfilePage': (BuildContext context) => MealProfilePage(),
          '/CartPage': (BuildContext context) => CartPage(),
        },
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}