import 'package:chop_chop_flutter/model/meal_item.dart';
import 'package:chop_chop_flutter/ui_elements/cards/restuarant_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RestaurantCardDeck extends StatelessWidget {
  final String deckTitle;

  RestaurantCardDeck({@required this.deckTitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(left: 16,),
            child: Text(deckTitle, style: Theme
                .of(context)
                .textTheme
                .subhead,)
        ),
        SizedBox(height: 18),
        Container(
          height: 154.0,
          child: ListView.builder(
            padding: EdgeInsets.only(bottom: 10),
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            itemBuilder: (BuildContext context, int index) {
              return RestaurantCard(
                  restaurantName: mealItemList.mealItems[index].restaurantName,
                  imageUrl: mealItemList.mealItems[index].mealImage
              );
            },
          ),
        ),
      ],
    );
  }
}