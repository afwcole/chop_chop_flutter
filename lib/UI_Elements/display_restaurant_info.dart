import 'package:chop_chop_flutter/model/meal_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DisplayRestaurantInfo extends StatelessWidget {
  final MealItem mealItem;

  DisplayRestaurantInfo({
    @required this.mealItem,
  });

  @override
  Widget build(BuildContext context) {
    ThemeData themeStyle = Theme.of(context);
    String bigTitleName = mealItem.mealName;
    double basePrice = mealItem.mealBasePrice;
    String description = mealItem.mealDescription;
    int estDeliveryTime = mealItem.estimatedDeliveryTime;
    int deliveryFee = mealItem.deliveryFee;

    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              //Big title
              alignment: Alignment.centerLeft,
              child: Text(bigTitleName, style: themeStyle.textTheme.headline,),
            ),
            Visibility(
              visible: basePrice != null,
              child: Container(
                //Displays price
                alignment: Alignment.centerRight,
                child: Text(
                  basePrice == null ? " " : "\$${basePrice.toStringAsFixed(2)}",
                  style: themeStyle.textTheme.subhead
                      .copyWith(color: Color(0xFF535353)),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 8),
        Container(
          //Description section
          alignment: Alignment.centerLeft,
          child: Text(description, style: themeStyle.textTheme.body1,),
        ),
        SizedBox(height: 12),
        Row(
          children: <Widget>[
            Container(
              //Delivery Time box container
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(color: Color(0x80C2791A)),
              child: Text(
                "Time: $estDeliveryTime mins", style: themeStyle.textTheme.display2,),
            ),
            SizedBox(width: 12),
            Container(
              //Delivery Fee box container
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(color: Color(0x80C2791A)),
              child: Text(
                  "Delivery Fee: Ghs $deliveryFee", style: themeStyle.textTheme.display2),
            ),
          ],
        ),
      ],
    );
  }
}