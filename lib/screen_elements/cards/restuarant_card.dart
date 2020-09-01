import 'package:chop_chop_flutter/data_model/restaurant_item.dart';
import 'package:chop_chop_flutter/pages/restaurant_profile_page.dart';
import 'package:flutter/material.dart';

class RestaurantCard extends StatelessWidget {
  final RestaurantItem restaurantItem;

  RestaurantCard({@required this.restaurantItem});

  @override
  Widget build(BuildContext context) {
    String restaurantName = restaurantItem.name;
    String imageUrl = restaurantItem.headerImage;

    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => RestaurantProfilePage(
                      restaurantItem: restaurantItem,
                    )
            ),
        );
      },
      child: Container(
          height: 144,
          width: 232,
          child: Card(
            elevation: 3,
            margin: EdgeInsets.only(left: 8, right: 8),
            //padding around each card left & right
            semanticContainer: true,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Stack(alignment: Alignment.bottomLeft, children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                // provides gradient on top of image for text legibility
                height: 144,
                width: 312,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment(0, .30),
                    colors: <Color>[Color(0xC0000000), Color(0x00000000)],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 16, bottom: 16),
                //text-padding in card
                alignment: Alignment.bottomLeft,
                child: Text(
                  restaurantName,
                  style: Theme.of(context).textTheme.title.copyWith(
                        color: Colors.white,
                      ),
                ),
              ),
            ]),
          )),
    );
  }
}
