import 'package:chop_chop_flutter/data_model/meal_item.dart';
import 'package:chop_chop_flutter/pages/meal_profile_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MealCard extends StatelessWidget {
  final MealItem mealItem;

  MealCard({
    @required this.mealItem,
  });

  @override
  Widget build(BuildContext context) {
    String _mealName = mealItem.name;
    String _restaurantName = mealItem.restaurantName;
    double _mealPrice = mealItem.basePrice;
    String _mealImage = mealItem.image;

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
        height: 190,
        width: 290, //312
        child: Card(
          elevation: 3,
          margin: EdgeInsets.symmetric(horizontal: 6),
          //padding around each card
          semanticContainer: true,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Column(
            children: <Widget>[
              Stack(alignment: Alignment.bottomLeft, children: <Widget>[
                Image.asset(_mealImage,
                    height: 137, width: 312, fit: BoxFit.cover),
                Container(
                  // provides gradient on top of image for text legibility
                  height: 137,
                  width: 312,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment(0, .35),
                      colors: <Color>[Color(0xC0000000), Color(0x00000000)],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 16, bottom: 8),
                  child: Text(
                    _mealName,
                    style: Theme.of(context)
                        .textTheme
                        .title
                        .copyWith(color: Colors.white),
                  ),
                ),
              ]),
              Container(
                height: 53,
                width: 312,
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //this line puts the elements on extreme ends
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(height: 8),
                          Container(
                            margin: EdgeInsets.fromLTRB(16, 0, 0, 4),
                            child: Text(
                              _restaurantName,
                              style: Theme.of(context).textTheme.subtitle,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(16, 0, 0, 0),
                            child: Text(
                              "15-20 mins",
                              style: Theme.of(context).textTheme.display2.copyWith(
                                        color: Color(0xFF707070),),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 16, 16, 16),
                        child: Text(
                          "\$" + _mealPrice.toStringAsFixed(2),
                          style: Theme.of(context).textTheme.display1,
                        ),
                      ),
                    ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
