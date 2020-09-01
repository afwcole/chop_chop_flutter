import 'package:chop_chop_flutter/pages/screen_elements/cards/category_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoryCardDeck extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 106.0,
        child: ListView(
            padding: EdgeInsets.only(bottom: 10),
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              CategoryCard(
                  imageDirName: 'images/Burger.jpg', categoryName: "Burgers"),
              CategoryCard(
                  imageDirName: 'images/Chicken.jfif', categoryName: "Chicken"),
              CategoryCard(
                  imageDirName: 'images/Rice.jpg', categoryName: "Rice"),
              CategoryCard(
                  imageDirName: 'images/Local.jpg', categoryName: "Local"),
              CategoryCard(
                  imageDirName: 'images/Noodles.jpg', categoryName: "More...")
            ]
        )
    );
  }
}