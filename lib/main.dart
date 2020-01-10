import 'package:flutter/material.dart';

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
        margin: EdgeInsets.symmetric(vertical: 20.0),
        height: 96.0,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            homeCards.categoryCard('images/Burger.jpg', "Burgers"),
            homeCards.categoryCard('images/Chicken.jfif', "Chicken"),
            homeCards.categoryCard('images/Rice.jpg', "Rice"),
            homeCards.categoryCard('images/Local.jpg', "Local"),
            homeCards.categoryCard('images/More.jpg', "More")
          ]
        )
      )
    );
  }
}


class homeCards {

  static Widget categoryCard(String imageDirName, String categoryName){
    return Container(
      width: 96.0,
      child: Card(
        elevation: 5,
        margin: EdgeInsets.all(4.0),
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
              margin: EdgeInsets.fromLTRB(8, 0, 0, 8),
              alignment: Alignment.bottomLeft,
              child: Text(
                categoryName,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                )
              )
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
      ),
    );
  }
}