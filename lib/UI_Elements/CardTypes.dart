import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget{
  final String categoryName;
  final String imageDirName;

  CategoryCard({@required this.categoryName, @required this.imageDirName});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 96,
      width: 96,
      child: Card(
        margin: EdgeInsets.only(left: 4, right: 4), //padding around each card
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(imageDirName),
                fit: BoxFit.cover,
              )
          ),
          child: Container(
            margin: EdgeInsets.fromLTRB(8, 0, 0, 8), //text-padding in card
            alignment: Alignment.bottomLeft,
            child: Text(
              categoryName,
              style: Theme.of(context).textTheme.subtitle.copyWith(
                color: Colors.white
              ),
            ),
          ),
        ),
      ),
    );
  }

}

class RestaurantCard extends StatelessWidget{
  final String restaurantName;
  final String imageUrl;

  RestaurantCard({@required this.restaurantName, @required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {Navigator.of(context).pushNamed('/RestaurantProfilePage');},
      child: Container(
        height: 144,
        width: 232,
        child: Card(
          elevation: 3,
          margin: EdgeInsets.only(left: 8, right: 8), //padding around each card left & right
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
              Container(// provides gradient on top of image for text legibility
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
                margin: EdgeInsets.only(left: 16, bottom: 16), //text-padding in card
                alignment: Alignment.bottomLeft,
                child: Text(restaurantName,
                  style: Theme.of(context).textTheme.title.copyWith(
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

class MealCard extends StatelessWidget{
  final String mealName;
  final String restaurantName;
  final double price;
  final String imageUrl;

  MealCard({
    @required this.mealName,
    @required this.restaurantName,
    @required this.price,
    @required this.imageUrl
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed('/MealProfilePage');
      },
      child: Container(
        height: 190,
        width: 312,
        child: Card(
          elevation: 3,
          margin: EdgeInsets.only(left: 8, right: 8),//padding around each card
          semanticContainer: true,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Column(
            children: <Widget>[
              Stack(
                alignment: Alignment.bottomLeft,
                children: <Widget>[// stacks text on top of gradient and image
                  Image.asset(imageUrl, height: 137, width: 312, fit: BoxFit.cover),
                  Container(// provides gradient on top of image for text legibility
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
                    child: Text(mealName,
                      style: Theme.of(context).textTheme.title.copyWith(
                        color: Colors.white
                      ),
                    ),
                  ),
                ]
              ),
              Container(
                height: 53,
                width: 312,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween, //this line puts the elements on extreme ends
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(height: 8),
                        Container(
                          margin: EdgeInsets.fromLTRB(16, 0, 0, 4),
                          child: Text(restaurantName,
                            style: Theme.of(context).textTheme.subtitle,),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(16, 0, 0, 0),
                          child: Text("15-20 mins",
                            style: Theme.of(context).textTheme.display2.copyWith(
                              color: Color(0xFF707070),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 16, 16, 16),
                      child: Text("\$$price",
                        style: Theme.of(context).textTheme.display1,
                      ),
                    ),
                  ]
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ColumnCard extends StatelessWidget{

  final String mealName;
  final String restaurantName;
  final double price;
  final String imageUrl;

  ColumnCard({
    @required this.mealName,
    @required this.restaurantName,
    @required this.price,
    @required this.imageUrl
  });

  @override
  Widget build(BuildContext context) {
    double textWidth = MediaQuery.of(context).size.width*0.6; // makes text width 60% of screen width
    return GestureDetector(
      onTap: () {Navigator.of(context).pushNamed('/MealProfilePage');},
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 14),
        child: Column(
          children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),// for the rounded corners of the image
            child: Image.asset(imageUrl, height: 137, width: 312, fit: BoxFit.cover),
          ),
          Container(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween, //this line puts the elements on extreme ends
                children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      width: textWidth,//sets max width of text field and puts remainder on next line
                      margin: EdgeInsets.only(left: 8, top: 8),
                      child: Text(mealName,
                        overflow: TextOverflow.ellipsis,
                        textDirection: TextDirection.ltr,
                        style: Theme.of(context).textTheme.title,),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 8, top: 2),
                      child: Text(restaurantName,
                        style: Theme.of(context).textTheme.subtitle,),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 8, bottom: 8),
                      child: Text("15-20 mins",
                        style: Theme.of(context).textTheme.display2.copyWith(
                          color: Color(0xFF707070),),
                      ),
                    ),],
                ),
                Container(
                  margin: EdgeInsets.only(right: 16),
                  child: Text("\$$price",
                    style: Theme.of(context).textTheme.subhead,
                  ),
                ),]
              )
            ),
            SizedBox(height: 18)//padding for below the widget
          ],
        ),
      ),
    );
  }
}

class MealCardTile extends StatelessWidget{
  final String mealName;
  final String restaurantName;
  final String imageURL;
  final double price;

  MealCardTile({
    @required this.mealName,
    @required this.restaurantName,
    @required this.imageURL,
    @required this.price,
  });

  @override
  Widget build(BuildContext context) {
    double textWidth = MediaQuery.of(context).size.width*0.35;

    return GestureDetector(
      onTap: (){Navigator.of(context).pushNamed('/MealProfilePage');},
      child: Container(
        height: 80,
        width: 312,
        margin: EdgeInsets.only(bottom: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [BoxShadow(color: Color(0x33000000), blurRadius: 8.0, spreadRadius: 5.0, offset: Offset(0.0, 3.0))],
          borderRadius: BorderRadius.circular(5),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(5.0), bottomLeft: Radius.circular(5.0)),
                  child: Image.asset(
                    imageURL,
                    height: 80,
                    width: 80,
                    fit: BoxFit.cover
                  ),
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
                      child: Text(
                        restaurantName,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.display4
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(left: 4, right: 16),
              child: Text(
                "\$$price",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600
                )
              ),
            )
          ],
        ),
      ),
    );
  }
}