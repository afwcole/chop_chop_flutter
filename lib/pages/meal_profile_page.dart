import 'dart:ui';

import 'package:chop_chop_flutter/data_model/cart_item.dart';
import 'package:chop_chop_flutter/data_model/extras_item.dart';
import 'package:chop_chop_flutter/data_model/meal_item.dart';
import 'package:chop_chop_flutter/meal_helper.dart';
import 'package:chop_chop_flutter/providers/cart_provider.dart';
import 'package:chop_chop_flutter/screen_elements/buttons/cart_fab.dart';
import 'package:chop_chop_flutter/screen_elements/checkbox_extras_tile.dart';
import 'package:chop_chop_flutter/screen_elements/buttons/pop_arrow_button.dart';
import 'package:chop_chop_flutter/screen_elements/display_restaurant_info.dart';
import 'package:chop_chop_flutter/screen_elements/header_and_logo.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:grouped_buttons/grouped_buttons.dart';
import 'package:provider/provider.dart';


class MealProfilePage extends StatefulWidget {
  final MealItem mealItem;
  MealProfilePage({Key key, this.title, @required this.mealItem}) : super(key: key);
  final String title;

  @override
  _MealProfilePageState createState() => _MealProfilePageState();
}

class _MealProfilePageState extends State<MealProfilePage> {
  MealItem _mealItem;
  List<ExtrasItem> _selectedExtras;
  MealHelper _mealHelper;

  @override
  void initState(){
    _mealItem = widget.mealItem;
    _mealHelper = MealHelper(mealBasePrice: _mealItem.mealBasePrice);
    _selectedExtras = [];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData themeStyle = Theme.of(context);
    _mealHelper.setTotalMealPrice();

    return Scaffold(
        body: SafeArea(
          child: Stack(children: <Widget>[
            CustomScrollView(slivers: <Widget>[
              SliverAppBar(
                backgroundColor: Colors.transparent,
                leading: PopArrowButton(),
                elevation: 0,
                expandedHeight: 200,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                    background: HeaderAndLogo(
                  headerImageUrl: _mealItem.mealImage,
                  showLogo: false,
                )),
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
                        child: Text("Extras",
                            style: themeStyle.textTheme.subhead.copyWith(
                                decoration: TextDecoration.underline)),
                      ),
                      CheckboxGroup(
                        activeColor: Theme.of(context).primaryColor,
                        onChange: ((bool isChecked, String label, int index) {
                          if (isChecked) {
                            setState(() {
                              _mealHelper.addExtrasPrice(
                                  _mealItem.extrasList[index].extrasPrice);
                            });
                          } else {
                            setState(() {
                              _mealHelper.subExtrasPrice(
                                  _mealItem.extrasList[index].extrasPrice);
                            });
                          }
                        }),
                        onSelected: ((List<String> checked) {
                          _selectedExtras = _getSelectedExtras(checked);
                        }),
                        labels: _mealItem.listExtrasNames(),
                        itemBuilder: (Checkbox cb, Text text, int index) {
                          return CheckboxExtrasTile(
                              checkbox: cb,
                              text: text,
                              price: _mealItem.extrasList[index].extrasPrice);
                        },
                      ),
                    ]),
                  ),
                ]),
              ),
            ]),
          ]),
        ),
        floatingActionButton: CartFAB(),
        bottomNavigationBar: bottomButtons(context));
  }

  Widget bottomButtons(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 8),
      child: Row(
        children: <Widget>[
          SizedBox(width: 8),
          twoWayButton(context),
          SizedBox(width: 4),
          Expanded(child: addButton(context)),
          SizedBox(width: 8),
        ],
      ),
    );
  }

  Widget twoWayButton(BuildContext context) {
    return Container(
      width: 114,
      padding: EdgeInsets.symmetric(vertical: 2),
      decoration: BoxDecoration(
          color: Color(0xFFCCCCCC), borderRadius: BorderRadius.circular(30)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          IconButton(
              icon: Icon(Icons.remove, color: Colors.black, size: 16),
              onPressed: () {
                setState(() {
                  _mealHelper.decrementQuantity();
                });
              }),
          Text(
            "${_mealHelper.quantity}",
            style: Theme.of(context)
                .textTheme
                .button
                .copyWith(color: Colors.black),
          ),
          IconButton(
              icon: Icon(Icons.add, color: Colors.black, size: 16),
              onPressed: () {
                setState(() {
                  _mealHelper.incrementQuantity();
                });
              }),
        ],
      ),
    );
  }

  Widget addButton(BuildContext context) {
    var _cartProvider = Provider.of<CartProvider>(context);
    return RaisedButton(
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 32),
      color: Theme.of(context).primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      onPressed: () {
        CartItem cartItem = CartItem(
          mealItem: _mealItem,
          selectedExtras: _selectedExtras,
          quantity: _mealHelper.quantity,
          totalMealPrice: _mealHelper.totalMealPrice,
        );
        _cartProvider.addToCartList(cartItem);
      },
      child: Text(
        "Add  \$${_mealHelper.totalMealPrice.toStringAsFixed(2)}",
        style: Theme.of(context).textTheme.button,
      ),
    );
  }

  List<ExtrasItem> _getSelectedExtras(List<String> checked) {
    List<ExtrasItem> temp = [];
    for (var i = 0; i < _mealItem.extrasList.length; i++) {
      if (checked.contains(_mealItem.extrasList[i].extrasName)) {
        temp.add(_mealItem.extrasList[i]);
      }
    }
    return temp;
  }
}
