import 'package:flutter/material.dart';

class RestaurantCard extends StatelessWidget {
  final String restaurantName;
  final String imageUrl;

  RestaurantCard({@required this.restaurantName, @required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed('/RestaurantProfilePage');
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
            child: Stack(
                alignment: Alignment.bottomLeft,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(imageUrl),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container( // provides gradient on top of image for text legibility
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
                    child: Text(restaurantName,
                      style: Theme
                          .of(context)
                          .textTheme
                          .title
                          .copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ]
            ),
          )
      ),
    );
  }

}