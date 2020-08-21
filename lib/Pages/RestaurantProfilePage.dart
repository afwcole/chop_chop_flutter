import 'dart:ui';

import 'package:chop_chop_flutter/Model/meal_item.dart';
import 'package:chop_chop_flutter/UI_Elements/CardTypes.dart';
import 'package:chop_chop_flutter/UI_Elements/PopArrowButton.dart';
import 'package:chop_chop_flutter/UI_Elements/ProfilePageElements.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class RestaurantProfilePage extends StatefulWidget {
  RestaurantProfilePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _RestaurantProfilePageState createState() => _RestaurantProfilePageState();
}

class _RestaurantProfilePageState extends State<RestaurantProfilePage>{
  final String _restaurantName = "Yummy Joint";
  final String _restaurantDescription = "Short description, 280 character limit,"
      " describing the restaurant. Great opportunity to convey a message to customers "
      "and students";
  final String _deliveryTime = "Time: 30 mins";
  final String _deliveryFee = "Delivery Fee: GHs 1";

  @override
  Widget build(BuildContext context) {
    final ThemeData themeStyle = Theme.of(context);

    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              leading: PopArrowButton(),
              backgroundColor: Colors.transparent,
              expandedHeight: 200,
              pinned: true,
              elevation: 0,
              flexibleSpace: FlexibleSpaceBar(
                  background: ProfileImageBackDropAndLogo(
                    backgroundImageUrl: 'images/Noodles.jpg',
                    logoImageUrl: 'images/Logo.png',
                    showLogo: true,
                  ),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate([
                Container(
                  color: Colors.white,
                  margin: EdgeInsets.only(top: 2),
                  padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                  child: Column(
                    children: <Widget>[
                      ProfileDataPresenter(
                        bigTitleName: _restaurantName,
                        description: _restaurantDescription,
                        deliveryFee: _deliveryFee,
                        avgDeliveryTime: _deliveryTime,
                      ),
                      SizedBox(height: 32),
                      Container( //Delivery Fee box container
                        alignment: Alignment.centerLeft,
                        child: Text("Menu", style: themeStyle.textTheme.subhead
                            .copyWith(decoration: TextDecoration.underline),
                        ),
                      ),
                      SizedBox(height: 24),
                      for(int index = 0; index < 4; index++)
                        MealCardTile(
                          mealName: mealItemList.mealItems[index].mealName,
                          restaurantName: mealItemList.mealItems[index]
                              .restaurantName,
                          imageURL: mealItemList.mealItems[index].imgUrl,
                          price: mealItemList.mealItems[index].price,
                        ),
                    ],
                  ),
                )
              ])
            )
          ]
        )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed('/CartPage');
        },
        child: Icon(Icons.shopping_cart),
        backgroundColor: Theme
            .of(context)
            .primaryColor,
      ),
    );
  }
}