import 'dart:ui';

import 'package:chop_chop_flutter/UI_Elements/CardTypes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class RestaurantPageProfile extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              title: Text(""),
              backgroundColor: Colors.white,
              expandedHeight: 200,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                background: ImageBackDropAndLogo(backgroundImageUrl: 'images/Noodles.jpg', logoImageUrl: 'images/Logo.png')
              )
            ),
            SliverFixedExtentList(
              itemExtent: 900,
              delegate: SliverChildListDelegate([
                        Container(
                            color: Colors.transparent,
                            child: Container(
                              decoration: BoxDecoration(
                                  boxShadow: [BoxShadow(blurRadius: 15.0, offset: Offset(5.0, 0.0))],
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(25.0),
                                    topRight: Radius.circular(25.0),
                                  )
                              ),
                              padding: EdgeInsets.fromLTRB(24, 16, 24, 16),
                              child: Column(
                                children: <Widget>[
                                  Container( //Restaurant name container
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                          "Yummy Joint",
                                          style: TextStyle(
                                              fontSize: 25,
                                              fontWeight: FontWeight.w700
                                          )
                                      )
                                  ),
                                  SizedBox(height: 8),
                                  Container( //restaurant description container
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                          "Short description, 280 character limit, describing the restaurant. Great opportunity to convey a message to customers and students",
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400
                                          )
                                      )
                                  ),
                                  SizedBox(height: 8),
                                  Row(
                                    children: <Widget>[
                                      Container( //Delivery Time box container
                                        alignment: Alignment.centerLeft,
                                        padding: EdgeInsets.all(5),
                                        decoration: BoxDecoration(color: Color(0x80C2791A)),
                                        child: Text(
                                          "Time: 30 mins",
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w600
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 16),
                                      Container( //Delivery Fee box container
                                        alignment: Alignment.centerLeft,
                                        padding: EdgeInsets.all(5),
                                        decoration: BoxDecoration(color: Color(0x80C2791A)),
                                        child: Text(
                                          "Delivery Fee: GHs 1",
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w600
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 32),
                                  Container( //Delivery Fee box container
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      "Menu",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w700,
                                          decoration: TextDecoration.underline
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 24),
                                  MealCardTile(
                                      mealName: "Beef Burger",
                                      restaurantName: "Yummy Joint",
                                      imageURL: 'images/Burger.jpg',
                                      price: 15.05
                                  ),
                                  MealCardTile(
                                      mealName: "Fried Chicken",
                                      restaurantName: "Yummy Joint",
                                      imageURL: 'images/Chicken.jfif',
                                      price: 14.99
                                  ),
                                  MealCardTile(
                                      mealName: "Banku and Tilapia",
                                      restaurantName: "Yummy Joint",
                                      imageURL: 'images/Local.jpg',
                                      price: 12.99
                                  ),
                                  MealCardTile(
                                      mealName: "Jollof Rice",
                                      restaurantName: "Yummy Joint",
                                      imageURL: 'images/Rice.jpg',
                                      price: 19.99
                                  ),
                                  MealCardTile(
                                      mealName: "Stir Fry",
                                      restaurantName: "Yummy Joint",
                                      imageURL: 'images/Noodles.jpg',
                                      price: 29.55
                                  )
                                ],
                              ),
                            )
                        )
              ])
            )
          ]
        )
      )
    );
  }
}

class ImageBackDropAndLogo extends StatelessWidget{
  final String backgroundImageUrl;
  final String logoImageUrl;

  ImageBackDropAndLogo({
    @required this.backgroundImageUrl,
    @required this.logoImageUrl
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 230,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: <Widget>[
          Container(
            height: 230,
            width: MediaQuery.of(context).size.width,
            child: Image.asset(
              backgroundImageUrl,
              fit: BoxFit.cover,
            ),
          ),
          Container(
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 5.0,
                  sigmaY: 5.0,
                ),
                child: Scaffold(
                  backgroundColor: Colors.black12,
                ),
              )
          ),
          Center(
            child: Stack(
              children: <Widget>[
                Container(
                    width: 90,
                    height: 90,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        boxShadow: [BoxShadow(blurRadius: 15.0)]
                    )
                ),
                Container(
                    width: 90,
                    height: 90,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: new DecorationImage(image: AssetImage(logoImageUrl), fit: BoxFit.fill),
                    )
                )
              ],
            ),
          )
        ],
      )
    );
  }

}

class SliverTrial extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            title: Text('Coding with Cole'),
            backgroundColor: Colors.deepOrangeAccent,
            expandedHeight: 200,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset('images/Burgers.jpg', fit: BoxFit.cover,),
            ),
          )
        ],
      )
    );
  }
}