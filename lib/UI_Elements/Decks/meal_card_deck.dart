import 'package:chop_chop_flutter/model/meal_item.dart';
import 'package:chop_chop_flutter/ui_elements/cards/meal_card.dart';
import 'package:flutter/material.dart';

class MealCardDeck extends StatelessWidget{

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
                mealItem: mealItemList.mealItems[index],
              );
            },
          ),
        ),
      ],
    );
  }
}