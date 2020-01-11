import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'DeckOfCards.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Chop Chop'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
                height: 96.0,
                margin: EdgeInsets.symmetric(vertical: 8.0),
                child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      DeckOfCards.categoryCard('images/Burger.jpg', "Burgers"),
                      DeckOfCards.categoryCard('images/Chicken.jfif', "Chicken"),
                      DeckOfCards.categoryCard('images/Rice.jpg', "Rice"),
                      DeckOfCards.categoryCard('images/Local.jpg', "Local"),
                      DeckOfCards.categoryCard('images/Noodles.jpg', "More...")
                    ]
                )
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.fromLTRB(12, 12, 0, 4),
              child: Text(
                "Restaurants",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                )
              )
            ),
            Container(
              height: 176.0,
              child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    DeckOfCards.restaurantCard('images/Local.jpg', "Freddies"),
                    DeckOfCards.restaurantCard('images/Burger.jpg', "Mr. Roberts"),
                    DeckOfCards.restaurantCard('images/Chicken.jfif', "BBQ City"),
                    DeckOfCards.restaurantCard('images/Noodles.jpg', "Sanbra"),
                    DeckOfCards.restaurantCard('images/Rice.jpg', "More...")
                  ]
              )
            )
          ]
        )
      )

    );
  }
}