import 'package:chop_chop_flutter/data_model/meal_item.dart';
import 'package:chop_chop_flutter/pages/meal_profile_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MealCardTile extends StatelessWidget {
  final MealItem mealItem;

  MealCardTile({@required this.mealItem});

  @override
  Widget build(BuildContext context) {
    double textWidth = MediaQuery.of(context).size.width * 0.35;
    String mealName = mealItem.name;
    String restaurantName = mealItem.restaurantName;
    String imageURL = mealItem.image;
    double price = mealItem.basePrice;

    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => MealProfilePage(
                      mealItem: mealItem,
                    )));
      },
      child: Container(
        height: 80,
        width: 312,
        margin: EdgeInsets.only(bottom: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Color(0x33000000),
                blurRadius: 8.0,
                spreadRadius: 5.0,
                offset: Offset(0.0, 3.0))
          ],
          borderRadius: BorderRadius.circular(5),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5.0),
                      bottomLeft: Radius.circular(5.0)),
                  child: Image.asset(imageURL,
                      height: 80, width: 80, fit: BoxFit.cover),
                ),
                SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 20),
                    Container(
                      width: textWidth,
                      child: Text(
                        mealName,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.display3,
                      ),
                    ),
                    Container(
                      width: textWidth,
                      child: Text(restaurantName,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.display4),
                    ),
                  ],
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(left: 4, right: 16),
              child: Text("\$" + price.toStringAsFixed(2),
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
            )
          ],
        ),
      ),
    );
  }
}
