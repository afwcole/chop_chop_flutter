import 'dart:ui';

import 'package:chop_chop_flutter/data_model/meal_item.dart';
import 'package:chop_chop_flutter/screen_elements/buttons/bottom_buttons.dart';
import 'package:chop_chop_flutter/screen_elements/buttons/pop_arrow_button.dart';
import 'package:chop_chop_flutter/screen_elements/display_restaurant_info.dart';
import 'package:chop_chop_flutter/screen_elements/header_and_logo.dart';
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
  MealItem _mealItem = mealItemList.mealItems[1];
  bool _checkedValue = true;
  double _extrasPrice = 3.6;

  @override
  Widget build(BuildContext context) {
    final ThemeData themeStyle = Theme.of(context);

    Widget checkboxExtrasTile(BuildContext context) {
      return CheckboxListTile(
        activeColor: Theme
            .of(context)
            .primaryColor,
        title: Text("Sweet Potato Chips", style: themeStyle.textTheme.body1),
        subtitle: Text("\$" + _extrasPrice.toStringAsFixed(2),
            style: themeStyle.textTheme.body1.copyWith(color: Color(0xFF535353))),
        value: _checkedValue,
        onChanged: (newValue) {
          setState(() {
            _checkedValue = newValue;
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
                    HeaderAndLogo(
                      headerImageUrl: _mealItem.mealImage,
                      showLogo: false,)),
              ),
              SliverList(
                delegate: SliverChildListDelegate([
                  Container(
                    color: Colors.white,
                    margin: EdgeInsets.only(top: 2),
                    padding: EdgeInsets.fromLTRB(24, 16, 24, 16),
                    child: Column(children: <Widget>[
                      DisplayRestaurantInfo(mealItem: _mealItem),
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
      bottomNavigationBar: BottomButtons(price: _mealItem.mealBasePrice)
    );
  }
}