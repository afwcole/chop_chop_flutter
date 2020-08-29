import 'dart:ui';

import 'package:chop_chop_flutter/data_model/restaurant_item.dart';
import 'package:chop_chop_flutter/screen_elements/buttons/cart_fab.dart';
import 'package:chop_chop_flutter/screen_elements/buttons/pop_arrow_button.dart';
import 'package:chop_chop_flutter/screen_elements/cards/meal_card_tile.dart';
import 'package:chop_chop_flutter/screen_elements/display_restaurant_info.dart';
import 'package:chop_chop_flutter/screen_elements/header_and_logo.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../temp_data/temp_restaurants_lists.dart';

class RestaurantProfilePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final ThemeData themeStyle = Theme.of(context);
    RestaurantItem _restaurantItem = tempRestaurantList.restaurantItems[0];

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
                    headerImageUrl: _restaurantItem.restaurantHeaderImage,
                    logoImageUrl: _restaurantItem.restaurantLogo,
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
                      DisplayRestaurantInfo(restaurantItem: _restaurantItem,),
                      SizedBox(height: 32),
                      Container( //Delivery Fee box container
                        alignment: Alignment.centerLeft,
                        child: Text("Menu", style: themeStyle.textTheme.subhead
                            .copyWith(decoration: TextDecoration.underline),
                        ),
                      ),
                      SizedBox(height: 24),
                      for(int index = 0; index < _restaurantItem.restaurantMenu.length; index++)
                        MealCardTile(mealItem: _restaurantItem.restaurantMenu[index]),
                    ],
                  ),
                )
              ])
            )
          ]
        )
      ),
      floatingActionButton: CartFAB(),
    );
  }
}