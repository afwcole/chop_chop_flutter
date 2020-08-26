import 'dart:ui';

import 'package:chop_chop_flutter/model/meal_item.dart';
import 'package:chop_chop_flutter/ui_elements/buttons/pop_arrow_button.dart';
import 'package:chop_chop_flutter/ui_elements/cards/meal_card_tile.dart';
import 'package:chop_chop_flutter/ui_elements/header_and_logo.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class RestaurantProfilePage extends StatelessWidget{
  final String _restaurantName = "Yummy Joint";
  final String _restaurantDescription = "Short description, 280 character limit,"
      " describing the restaurant. Great opportunity to convey a message to customers "
      "and students";
  final int _deliveryTime = 30;
  final int _deliveryFee = 1;

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
                  background: HeaderAndLogo(
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
//                      DisplayRestaurantInfo(
//                        bigTitleName: _restaurantName,
//                        description: _restaurantDescription,
//                        deliveryFee: _deliveryFee,
//                        estDeliveryTime: _deliveryTime,
//                      ),
                      SizedBox(height: 32),
                      Container( //Delivery Fee box container
                        alignment: Alignment.centerLeft,
                        child: Text("Menu", style: themeStyle.textTheme.subhead
                            .copyWith(decoration: TextDecoration.underline),
                        ),
                      ),
                      SizedBox(height: 24),
                      for(int index = 0; index < 4; index++)
                        MealCardTile(mealItem: mealItemList.mealItems[index]),
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