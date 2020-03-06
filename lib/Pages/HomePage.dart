import 'package:chop_chop_flutter/Model/meal_item.dart';
import 'package:chop_chop_flutter/UI_Elements/CardTypes.dart';
import 'package:chop_chop_flutter/UI_Elements/Decks.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(// Code for the appBar
          leading: IconButton(
            icon: Icon(Icons.menu), // 3-line menu drawer icon
            onPressed: () {},
          ),
          title: Image.asset( //LOGO
            "images/Logo.png",
            height: 45,
            width: 45
          ),
          centerTitle: true, // places the logo in the middle of appbar
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                //Navigator.of(context).pushNamed('/RestaurantProfilePage');
              }
            ),
          ]
      ),
      body: SafeArea(
        child: Container(
          child: ListView(
            children: <Widget>[
              SizedBox(height: 24),
              title(),
              SizedBox(height: 24),
              CategoryDeck(),
              SizedBox(height: 26),
              RestaurantCardDeck(deckTitle: "Restaurants"),
              SizedBox(height: 26),
              MealDeck(),
              SizedBox(height: 26),
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(left: 16),
                child: Text(
                  "More Choices",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  )
                )
              ),
              SizedBox(height: 18),
              Container(
                child: Column(
                  children: <Widget>[
                    for(var mealItem in mealItemList.mealItems)
                      ColumnCard(
                        imageUrl: mealItem.imgUrl,
                        restaurantName: mealItem.restaurantName,
                        mealName: mealItem.mealName,
                        price: mealItem.price,
                      ),
                  ],
                ),
              )
            ]
          )
        )
      )
    );
  }
}

Widget title() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: <Widget>[
      SizedBox(width: 16),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Let's",
            style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 25,
                color: Color(0xFFA2A2A2)
            ),
          ),
          Text(
            "Chop",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 30,
            ),
          ),
        ],
      )
    ],
  );
}