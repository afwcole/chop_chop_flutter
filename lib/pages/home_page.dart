import 'package:chop_chop_flutter/data_model/meal_item.dart';
import 'package:chop_chop_flutter/screen_elements/cards/column_card.dart';
import 'package:chop_chop_flutter/screen_elements/card_decks/category_card_deck.dart';
import 'package:chop_chop_flutter/screen_elements/card_decks/meal_card_deck.dart';
import 'package:chop_chop_flutter/screen_elements/card_decks/restaurant_card_deck.dart';
import 'package:chop_chop_flutter/screen_elements/standard_drawer.dart';
import 'package:chop_chop_flutter/screen_elements/title.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../data_search.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final ThemeData themeStyle = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Image.asset( "images/Logo.png", height: 45, width: 45),
        centerTitle: true,
        elevation: 0,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(context: context, delegate: DataSearch());
            })
        ]
      ),
      drawer: StandardDrawer(),
      body: SafeArea(
        child: Container(
          color: Colors.white,
          child: ListView(
            children: <Widget>[
              SizedBox(height: 24),
              title("Let's", "Chop"),
              SizedBox(height: 24),
              CategoryCardDeck(),
              SizedBox(height: 26),
              RestaurantCardDeck(deckTitle: "Restaurants"),
              SizedBox(height: 26),
              MealCardDeck(),
              SizedBox(height: 26),
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(left: 16),
                child: Text("More Choices", style: themeStyle.textTheme.subhead),),
              SizedBox(height: 18),
              Container(
                child: Column(
                  children: <Widget>[
                    for(MealItem mealItem in mealItemList.mealItems)
                      ColumnCard(mealItem: mealItem),
                  ],
                ),
              )
            ]
          )
        )
      ),
     floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        child: Icon(Icons.shopping_cart),
        onPressed: () {Navigator.of(context).pushNamed('/CartPage');},
      ),
    );
  }
}
