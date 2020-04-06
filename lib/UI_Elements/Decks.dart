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
          CategoryCard(imageDirName: 'images/Burger.jpg', categoryName: "Burgers"),
          CategoryCard(imageDirName: 'images/Chicken.jfif', categoryName: "Chicken"),
          CategoryCard(imageDirName: 'images/Rice.jpg', categoryName: "Rice"),
          CategoryCard(imageDirName: 'images/Local.jpg', categoryName: "Local"),
          CategoryCard(imageDirName: 'images/Noodles.jpg', categoryName: "More...")
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
          margin: EdgeInsets.only(left: 16,),
          child: Text(deckTitle, style: Theme.of(context).textTheme.subhead,)
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
                  imageUrl: mealItemList.mealItems[index].imgUrl
                );
              },
            ),
        ),
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
          child: Text("Top Choices", style: Theme.of(context).textTheme.subhead,),
        ),
        SizedBox(height: 18),
        Container(
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.only(bottom: 10),
            itemCount: 5,
            itemBuilder: (BuildContext context, int index) {
              return MealCard(
                imageUrl: mealItemList.mealItems[index].imgUrl,
                mealName: mealItemList.mealItems[index].mealName,
                restaurantName: mealItemList.mealItems[index].restaurantName,
                price: mealItemList.mealItems[index].price
              );
            },
          ),
        ),
      ],
    );
  }
}