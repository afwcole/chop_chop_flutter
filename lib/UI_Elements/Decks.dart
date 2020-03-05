import 'package:chop_chop_flutter/Model/meal_item.dart';
import 'package:flutter/material.dart';
import 'CardTypes.dart';

class CategoryDeck extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 106.0,
      child: ListView(
        padding: EdgeInsets.only(bottom: 10),
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          categoryCard('images/Burger.jpg', "Burgers"),
          categoryCard('images/Chicken.jfif', "Chicken"),
          categoryCard('images/Rice.jpg', "Rice"),
          categoryCard('images/Local.jpg', "Local"),
          categoryCard('images/Noodles.jpg', "More...")
        ]
      )
    );
  }
}

class PlainCardDeck extends StatelessWidget{
  final String deckTitle;

  PlainCardDeck({@required this.deckTitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          alignment: Alignment.centerLeft,
          margin: EdgeInsets.only(left: 16),
          child: Text(
            deckTitle,
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            )
          )
        ),
        SizedBox(height: 18),
        Container(
            height: 154.0,
            child: ListView(
                padding: EdgeInsets.only(bottom: 10),
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  for(var mealItem in mealItemList.mealItems)
                    //Should go through list of available/top restaurants NB: implement later
                    RestaurantCard(
                        restaurantName: mealItem.restaurantName,
                        imageUrl: mealItem.imgUrl
                    )
                ]
            )
        )
      ],
    );
  }
}


class MealDeck extends StatelessWidget{

  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          alignment: Alignment.centerLeft,
          margin: EdgeInsets.only(left: 16),
          child: Text(
            "Top Choices",
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            )
          )
        ),
        SizedBox(height: 18),
        Container(
          height: 200,
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.only(bottom: 10),
            children: <Widget>[
              for(var mealItem in mealItemList.mealItems)
                //iterate through Top Meal choice NB: implement later
                 MealCard(
                   mealName: mealItem.mealName,
                   restaurantName: mealItem.restaurantName,
                   price: mealItem.price,
                   imageUrl: mealItem.imgUrl
                 )
            ]
          )
        )
      ],
    );
  }
}