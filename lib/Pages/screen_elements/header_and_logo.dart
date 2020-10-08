import 'dart:ui';

import 'package:chop_chop_flutter/data_model/meal_item.dart';
import 'package:chop_chop_flutter/data_model/restaurant_item.dart';
import 'package:flutter/material.dart';

class HeaderAndLogo extends StatelessWidget {
  final MealItem mealItem;
  final RestaurantItem restaurantItem;

  HeaderAndLogo({
    this.mealItem,
    this.restaurantItem,
  });

  @override
  Widget build(BuildContext context) {
    String _headerImageUrl =
        mealItem != null ? mealItem.image : restaurantItem.headerImage;
    String _logoImageUrl = mealItem != null ? null : restaurantItem.logoImage;

    return Container(
      height: MediaQuery.of(context).size.height * 0.5,
      child: Stack(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height * 0.5,
            width: MediaQuery.of(context).size.width,
            child: Image.asset(
              _headerImageUrl,
              fit: BoxFit.cover,
            ),
          ),
          Visibility(
            visible: mealItem == null,
            child: Stack(
              children: <Widget>[
                Container(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: 2.0,
                      sigmaY: 2.0,
                    ),
                    child: Scaffold(
                      backgroundColor: Colors.black12,
                    ),
                  ),
                ),
                Center(
                  child: Stack(
                    children: <Widget>[
                      Container(
                        width: 90,
                        height: 90,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                            boxShadow: [BoxShadow(blurRadius: 15.0)]),
                      ),
                      Container(
                        width: 90,
                        height: 90,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: new DecorationImage(
                              image: AssetImage(
                                  _logoImageUrl == null ? " " : _logoImageUrl),
                              fit: BoxFit.fill),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
