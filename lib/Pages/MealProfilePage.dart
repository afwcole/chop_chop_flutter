import 'dart:ui';

import 'package:chop_chop_flutter/UI_Elements/BottomButtons.dart';
import 'package:chop_chop_flutter/UI_Elements/PopArrowButton.dart';
import 'package:chop_chop_flutter/UI_Elements/ProfilePageElements.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';

class MealProfilePage extends StatefulWidget {
  MealProfilePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MealProfilePageState createState() => _MealProfilePageState();
}

class _MealProfilePageState extends State<MealProfilePage> {
  bool checkedValue = true;
  final String _mealName = "Beef Burger";
  final String _stringPrice = "\$12.11";
  final String _mealDescription =
      "Short description, 280 character limit, describing the meal and all the ingredients involved. Opportunity to convey a message to customers and sell the product";
  final String _avgDeliveryTime = "Time: 30 mins";
  final String _deliveryFee = "Delivery Fee: Ghs 1";

  @override
  Widget build(BuildContext context) {
    final ThemeData themeStyle = Theme.of(context);

    Widget checkboxExtrasTile(BuildContext context) {
      return CheckboxListTile(
        activeColor: Theme
            .of(context)
            .primaryColor,
        title: Text("Sweet Potato Chips", style: themeStyle.textTheme.body1),
        subtitle: Text("\$3.50",
            style: themeStyle.textTheme.body1.copyWith(color: Color(0xFF535353))),
        value: checkedValue,
        onChanged: (newValue) {
          setState(() {
            checkedValue = newValue;
          });
        },
        controlAffinity: ListTileControlAffinity.leading,
      );
    }

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            CustomScrollView(slivers: <Widget>[
              SliverAppBar(
                backgroundColor: Colors.transparent,
                leading: PopArrowButton(),
                elevation: 0,
                expandedHeight: 200,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                    background:
                    ProfileImageBackDropAndLogo(
                      backgroundImageUrl: 'images/Burger.jpg',
                      showLogo: false,)),
              ),
              SliverList(
                delegate: SliverChildListDelegate([
                  Container(
                    color: Colors.white,
                    margin: EdgeInsets.only(top: 2),
                    padding: EdgeInsets.fromLTRB(24, 16, 24, 16),
                    child: Column(children: <Widget>[
                      ProfileDataPresenter(
                          bigTitleName: _mealName,
                          stringPrice: _stringPrice,
                          description: _mealDescription,
                          avgDeliveryTime: _avgDeliveryTime,
                          deliveryFee: _deliveryFee),
                      SizedBox(height: 32),
                      Container(
                        //Delivery Fee box container
                        alignment: Alignment.centerLeft,
                        child: Text(
                            "Extras", style: themeStyle.textTheme.subhead
                            .copyWith(decoration: TextDecoration.underline)),
                      ),
                      checkboxExtrasTile(context),
                      checkboxExtrasTile(context),
                      checkboxExtrasTile(context),
                      checkboxExtrasTile(context),
                      checkboxExtrasTile(context),
                    ]),
                  ),
                ]),
              ),
            ]),
          ]
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){Navigator.of(context).pushNamed('/CartPage');},
        child: Icon(Icons.shopping_cart),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      bottomNavigationBar: BottomButtons(price: 12.11)
    );
  }
}

