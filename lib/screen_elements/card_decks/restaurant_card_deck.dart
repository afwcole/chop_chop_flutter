import 'package:chop_chop_flutter/data_model/restaurant_item.dart';
import 'package:chop_chop_flutter/screen_elements/cards/restuarant_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RestaurantCardDeck extends StatelessWidget {
  final String deckTitle;
  final RestaurantItemList restaurantItemList;

  RestaurantCardDeck({@required this.deckTitle, @required this.restaurantItemList});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(
              left: 16,
            ),
            child: Text(
              deckTitle,
              style: Theme.of(context).textTheme.subhead,
            )),
        SizedBox(height: 18),
        Container(
          height: 154.0,
          child: ListView.builder(
            padding: EdgeInsets.only(bottom: 10),
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            itemBuilder: (BuildContext context, int index) {
              return RestaurantCard(
                restaurantItem: restaurantItemList.restaurantItems[index],
              );
            },
          ),
        ),
      ],
    );
  }
}
