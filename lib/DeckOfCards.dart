import 'package:flutter/material.dart';

class DeckOfCards {

  static Widget categoryCard(String imageDirName, String categoryName){
    return Container(
      height: 96.0,
      width: 96.0,
      child: Card(
        elevation: 3,
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
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  )
              )
          ),
        ),
      ),
    );
  }

  static Widget restaurantCard(String imageDirName, String restaurantName){
    return Container(
        height: 176,
        width: 272,
        child: Card(
          elevation: 3,
          margin: EdgeInsets.all(6.0),
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
                margin: EdgeInsets.fromLTRB(16, 0, 0, 12),
                alignment: Alignment.bottomLeft,
                child: Text(
                    restaurantName,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    )
                )
            ),
          ),

          /*
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0.0),
        ),
        */

        )
    );
  }
}