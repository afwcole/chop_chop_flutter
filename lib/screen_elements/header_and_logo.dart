import 'dart:ui';

import 'package:flutter/material.dart';

class HeaderAndLogo extends StatelessWidget {
  final String headerImageUrl;
  final bool showLogo;
  final String logoImageUrl;

  HeaderAndLogo({
    @required this.headerImageUrl,
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
            child: Image.asset(headerImageUrl, fit: BoxFit.cover,),
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