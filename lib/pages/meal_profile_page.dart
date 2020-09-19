import 'dart:ui';

import 'package:chop_chop_flutter/data_model/cart_item.dart';
import 'package:chop_chop_flutter/data_model/extras_item.dart';
import 'package:chop_chop_flutter/data_model/meal_item.dart';
import 'package:chop_chop_flutter/pages/screen_elements/buttons/bottom_buttons.dart';
import 'package:chop_chop_flutter/pages/screen_elements/buttons/pop_arrow_button.dart';
import 'package:chop_chop_flutter/pages/screen_elements/display_restaurant_info.dart';
import 'package:chop_chop_flutter/pages/screen_elements/header_and_logo.dart';
import 'package:chop_chop_flutter/pages/screen_elements/my_custom_draggable_sheet.dart';
import 'package:chop_chop_flutter/pages/screen_elements/tiles/checkbox_extras_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:grouped_buttons/grouped_buttons.dart';

class MealProfilePage extends StatefulWidget {
  final MealItem mealItem;
  final CartItem cartItem;
  MealProfilePage({Key key, this.title, this.mealItem, this.cartItem})
      : super(key: key);
  final String title;

  @override
  _MealProfilePageState createState() => _MealProfilePageState();
}

class _MealProfilePageState extends State<MealProfilePage> {
  MealItem _mealItem;
  List<ExtrasItem> _selectedExtras;
  double _currentMealBasePrice;
  double _mealBasePrice;
  double _totalExtrasPrice;

  @override
  void initState() {
    if (widget.mealItem != null) {
      _mealItem = widget.mealItem;
      _selectedExtras = <ExtrasItem>[];
      _totalExtrasPrice = 0;
      _mealBasePrice = _mealItem.basePrice;
    } else {
      _mealItem = widget.cartItem.mealItem;
      _selectedExtras = widget.cartItem.selectedExtras;
      _totalExtrasPrice = widget.cartItem.getTotalExtrasPrice();
      _mealBasePrice = widget.cartItem.mealItem.basePrice;
    }
    _currentMealBasePrice = _mealBasePrice + _totalExtrasPrice;
    super.initState();
  }

  //Getters
  double get currentMealBasePrice => _currentMealBasePrice;
  List<ExtrasItem> get selectedExtras => _selectedExtras;

  @override
  Widget build(BuildContext context) {
    final ThemeData themeStyle = Theme.of(context);

    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          leading: PopArrowButton(),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Stack(
          children: <Widget>[
            HeaderAndLogo(
              mealItem: _mealItem,
            ),
            MyCustomDraggableSheet(
              child: Container(
                color: Colors.white,
                margin: EdgeInsets.only(top: 2),
                padding: EdgeInsets.fromLTRB(24, 16, 24, 16),
                child: Column(children: <Widget>[
                  DisplayRestaurantInfo(mealItem: _mealItem),
                  SizedBox(height: 32),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text("Extras",
                        style: themeStyle.textTheme.subhead
                            .copyWith(decoration: TextDecoration.underline)),
                  ),
                  CheckboxGroup(
                    checked: _selectedExtras
                        .map((extraItem) => extraItem.name)
                        .toList(),
                    activeColor: Theme.of(context).primaryColor,
                    onChange: ((bool isChecked, String label, int index) {
                      setState(() {
                        if (isChecked) {
                          _totalExtrasPrice +=
                              _mealItem.extrasList[index].price;
                        } else {
                          _totalExtrasPrice -=
                              _mealItem.extrasList[index].price;
                        }

                        _currentMealBasePrice =
                            _mealBasePrice + _totalExtrasPrice;
                      });
                    }),
                    onSelected: ((List<String> checked) {
                      _selectedExtras = _getSelectedExtras(checked);
                    }),
                    labels: _mealItem.listExtrasNames(),
                    itemBuilder: (Checkbox cb, Text text, int index) {
                      return CheckboxExtrasTile(
                          checkbox: cb,
                          text: text,
                          price: _mealItem.extrasList[index].price);
                    },
                  ),
                  SizedBox(
                    height: 50,
                  ),
                ]),
              ),
            ),
          ],
        ),
        floatingActionButton: widget.mealItem != null
            ? BottomButtons(
                mealItem: _mealItem,
                selectedExtras: selectedExtras,
                currentMealBasePrice: currentMealBasePrice,
              )
            : BottomButtons(
                cartItem: widget.cartItem,
                selectedExtras: selectedExtras,
                currentMealBasePrice: currentMealBasePrice,
              ),
        floatingActionButtonLocation:
            FloatingActionButtonLocation.miniCenterDocked,
      ),
    );
  }

  List<ExtrasItem> _getSelectedExtras(List<String> checked) {
    List<ExtrasItem> temp = [];
    for (var i = 0; i < _mealItem.extrasList.length; i++)
      if (checked.contains(_mealItem.extrasList[i].name))
        temp.add(_mealItem.extrasList[i]);

    return temp;
  }
}
