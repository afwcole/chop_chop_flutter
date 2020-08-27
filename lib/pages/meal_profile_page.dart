import 'dart:ui';

import 'package:chop_chop_flutter/data_model/extras_item.dart';
import 'package:chop_chop_flutter/data_model/meal_item.dart';
import 'package:chop_chop_flutter/screen_elements/CheckboxExtrasTile.dart';
import 'package:chop_chop_flutter/screen_elements/buttons/bottom_buttons.dart';
import 'package:chop_chop_flutter/screen_elements/buttons/pop_arrow_button.dart';
import 'package:chop_chop_flutter/screen_elements/display_restaurant_info.dart';
import 'package:chop_chop_flutter/screen_elements/header_and_logo.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:grouped_buttons/grouped_buttons.dart';

class MealProfilePage extends StatefulWidget {
  MealProfilePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MealProfilePageState createState() => _MealProfilePageState();
}

class _MealProfilePageState extends State<MealProfilePage> {
  MealItem _mealItem = mealItemList.mealItems[1];
  List<ExtrasItem> _selectedExtras = [];

  List<ExtrasItem> getSelectedExtras(List<String> checked){
    List<ExtrasItem> temp = [];
    for (var i = 0; i < _mealItem.extrasList.length; i++) {
      if (checked.contains(_mealItem.extrasList[i].extrasName))
        temp.add(_mealItem.extrasList[i]);
    }
    return temp;
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData themeStyle = Theme.of(context);

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
                        alignment: Alignment.centerLeft,
                        child: Text(
                            "Extras", style: themeStyle.textTheme.subhead
                            .copyWith(decoration: TextDecoration.underline)),
                      ),
                      CheckboxGroup(
                        activeColor: Theme.of(context).primaryColor,
                        onChange: ((bool isChecked, String label, int index) {}),
                        onSelected: ((List<String> checked) {
                          _selectedExtras = getSelectedExtras(checked);
                        }),
                        labels: _mealItem.listExtrasNames(),
                        itemBuilder: (Checkbox cb, Text  text, int index){
                          return CheckboxExtrasTile(checkbox: cb, text: text, price: _mealItem.extrasList[index].extrasPrice);
                        },
                      ),
                    ]),
                  ),
                ]),
              ),
            ]),
          ]
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: ((){
          Navigator.of(context).pushNamed('/CartPage');
        }),
        child: Icon(Icons.shopping_cart),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      bottomNavigationBar: BottomButtons(price: _mealItem.mealBasePrice)
    );
  }
}