import 'file:///C:/Users/Adria/IdeaProjects/chop_chop_flutter/lib/data_model/meal_item.dart';
import 'package:flutter/material.dart';

class ColumnCard extends StatelessWidget {

  final MealItem mealItem;

  ColumnCard({
    @required this.mealItem
  });


  @override
  Widget build(BuildContext context) {
    String mealName = mealItem.mealName;
    String restaurantName = mealItem.restaurantName;
    double price = mealItem.mealBasePrice;
    String imageUrl = mealItem.mealImage;
    double textWidth = MediaQuery
        .of(context)
        .size
        .width * 0.6; // makes text width 60% of screen width

    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed('/MealProfilePage');
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 14),
        child: Column(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              // for the rounded corners of the image
              child: Image.asset(
                  imageUrl, height: 137, width: 312, fit: BoxFit.cover),
            ),
            Container(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //this line puts the elements on extreme ends
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            width: textWidth,
                            //sets max width of text field and puts remainder on next line
                            margin: EdgeInsets.only(left: 8, top: 8),
                            child: Text(mealName,
                              overflow: TextOverflow.ellipsis,
                              textDirection: TextDirection.ltr,
                              style: Theme
                                  .of(context)
                                  .textTheme
                                  .title,),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 8, top: 2),
                            child: Text(restaurantName,
                              style: Theme
                                  .of(context)
                                  .textTheme
                                  .subtitle,),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 8, bottom: 8),
                            child: Text("15-20 mins",
                              style: Theme
                                  .of(context)
                                  .textTheme
                                  .display2
                                  .copyWith(
                                color: Color(0xFF707070),),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 16),
                        child: Text("\$" + price.toStringAsFixed(2),
                          style: Theme
                              .of(context)
                              .textTheme
                              .subhead,
                        ),
                      ),
                    ]
                )
            ),
            SizedBox(height: 18) //padding for below the widget
          ],
        ),
      ),
    );
  }
}