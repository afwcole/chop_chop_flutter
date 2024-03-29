import 'package:chop_chop_flutter/data_model/meal_item.dart';
import 'package:chop_chop_flutter/data_model/restaurant_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DisplayRestaurantInfo extends StatelessWidget {
  final MealItem mealItem;
  final RestaurantItem restaurantItem;

  DisplayRestaurantInfo({
    this.mealItem,
    this.restaurantItem,
  });

  @override
  Widget build(BuildContext context) {
    ThemeData themeStyle = Theme.of(context);
    String bigTitleName;
    double basePrice;
    String description;
    int estDeliveryTime;
    int deliveryFee;

    if (mealItem != null) {
      bigTitleName = mealItem.name;
      basePrice = mealItem.basePrice;
      description = mealItem.description;
      estDeliveryTime = mealItem.estDeliveryTime;
      deliveryFee = mealItem.deliveryFee;
    } else {
      bigTitleName = restaurantItem.name;
      description = restaurantItem.description;
      estDeliveryTime = restaurantItem.estimatedDeliveryTime;
      deliveryFee = restaurantItem.deliveryFee;
    }

    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width * 0.65,
              alignment: Alignment.centerLeft,
              child: Text(
                bigTitleName,
                style: themeStyle.textTheme.headline,
                overflow: TextOverflow.fade,
              ),
            ),
            Visibility(
              visible: basePrice != null,
              child: Container(
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
          alignment: Alignment.topCenter,
          child: Text(
            description,
            style: themeStyle.textTheme.body1,
          ),
        ),
        SizedBox(height: 12),
        Row(
          children: <Widget>[
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(color: Color(0x80C2791A)),
              child: Text(
                "Time: $estDeliveryTime mins",
                style: themeStyle.textTheme.display2,
              ),
            ),
            SizedBox(width: 12),
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(color: Color(0x80C2791A)),
              child: Text("Delivery Fee: Ghs $deliveryFee",
                  style: themeStyle.textTheme.display2),
            ),
          ],
        ),
      ],
    );
  }
}
