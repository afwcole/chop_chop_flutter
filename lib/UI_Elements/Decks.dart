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

class RestaurantCardDeck extends StatelessWidget{
  final String deckTitle;

  RestaurantCardDeck({@required this.deckTitle});

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
            child: ListView.builder(
              padding: EdgeInsets.only(bottom: 10),
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap:() {Navigator.of(context).pushNamed('/RestaurantProfilePage');},
                  child: RestaurantCard(
                    restaurantName: mealItemList.mealItems[index].restaurantName,
                    imageUrl: mealItemList.mealItems[index].imgUrl
                  )
                );
              },
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
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.only(bottom: 10),
            itemCount: 5,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                //onTap: (){Navigator.of(context).pushNamed('/RestaurantProfilePage');},
                child: MealCard(
                  imageUrl: mealItemList.mealItems[index].imgUrl,
                  mealName: mealItemList.mealItems[index].mealName,
                  restaurantName: mealItemList.mealItems[index].restaurantName,
                  price: mealItemList.mealItems[index].price
                ),
              );
            },
          )
        )
      ],
    );
  }
}