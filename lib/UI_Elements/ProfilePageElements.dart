import 'dart:ui';

import 'package:flutter/material.dart';

class ProfileImageBackDropAndLogo extends StatelessWidget {
  final String backgroundImageUrl;
  final bool showLogo;
  final String logoImageUrl;

  ProfileImageBackDropAndLogo({
    @required this.backgroundImageUrl,
    this.logoImageUrl,
    @required this.showLogo,
  });

  @override
  Widget build(BuildContext context) {

    return Container(
      height: 230,
      child: Stack(
        children: <Widget>[
          Container(
            height: 230,
            width: MediaQuery
                .of(context)
                .size
                .width,
            child: Image.asset(backgroundImageUrl, fit: BoxFit.cover,),
          ),
          Visibility(
            visible: showLogo,
            child: Stack(
              children: <Widget>[
                Container(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: 2.0,
                      sigmaY: 2.0,
                    ),
                    child: Scaffold(
                      backgroundColor: Colors.black12,),
                  ),
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
                            boxShadow: [BoxShadow(blurRadius: 15.0)]),
                      ),
                      Container(
                        width: 90,
                        height: 90,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: new DecorationImage(
                           image: AssetImage(logoImageUrl == null ? " " : logoImageUrl),
                           fit: BoxFit.fill),
                        ),
                      ),
                    ],
                  ),
                )
              ],),
          ),
        ],
      ),
    );
  }
}

class ProfileDataPresenter extends StatelessWidget {
  final String bigTitleName;
  final double basePrice;
  final String description;
  final String avgDeliveryTime;
  final String deliveryFee;

  ProfileDataPresenter({
    @required this.bigTitleName,
    this.basePrice,
    @required this.description,
    @required this.avgDeliveryTime,
    @required this.deliveryFee,
  });

  @override
  Widget build(BuildContext context) {
    ThemeData themeStyle = Theme.of(context);

    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              //Big title
              alignment: Alignment.centerLeft,
              child: Text(bigTitleName, style: themeStyle.textTheme.headline,),
            ),
            Visibility(
              visible: basePrice != null,
              child: Container(
                //Displays price
                alignment: Alignment.centerRight,
                child: Text(
                  basePrice == null ? " " : "\$" + basePrice.toStringAsFixed(2),
                  style: themeStyle.textTheme.subhead
                      .copyWith(color: Color(0xFF535353)),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 8),
        Container(
          //Description section
          alignment: Alignment.centerLeft,
          child: Text(description, style: themeStyle.textTheme.body1,),
        ),
        SizedBox(height: 12),
        Row(
          children: <Widget>[
            Container(
              //Delivery Time box container
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(color: Color(0x80C2791A)),
              child: Text(
                avgDeliveryTime, style: themeStyle.textTheme.display2,),
            ),
            SizedBox(width: 12),
            Container(
              //Delivery Fee box container
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(color: Color(0x80C2791A)),
              child: Text(deliveryFee, style: themeStyle.textTheme.display2),
            ),
          ],
        ),
      ],
    );
  }
}