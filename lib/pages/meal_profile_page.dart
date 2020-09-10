import 'dart:async';
import 'dart:ui';

import 'package:chop_chop_flutter/data_model/cart_item.dart';
import 'package:chop_chop_flutter/data_model/extras_item.dart';
import 'package:chop_chop_flutter/data_model/meal_item.dart';
import 'package:chop_chop_flutter/pages/screen_elements/buttons/cart_fab.dart';
import 'package:chop_chop_flutter/pages/screen_elements/buttons/pop_arrow_button.dart';
import 'package:chop_chop_flutter/pages/screen_elements/display_restaurant_info.dart';
import 'package:chop_chop_flutter/pages/screen_elements/header_and_logo.dart';
import 'package:chop_chop_flutter/pages/screen_elements/my_custom_draggable_sheet.dart';
import 'package:chop_chop_flutter/pages/screen_elements/tiles/checkbox_extras_tile.dart';
import 'package:chop_chop_flutter/providers/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:grouped_buttons/grouped_buttons.dart';
import 'package:provider/provider.dart';

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
  double _totalMealPrice;
  int _quantity;
  double _mealBasePrice;
  double _totalExtrasPrice;

  int _buttonState = 0;

  @override
  void initState() {
    if (widget.mealItem != null) {
      _mealItem = widget.mealItem;
      _selectedExtras = <ExtrasItem>[];
      _quantity = 1;
      _totalExtrasPrice = 0;
      _mealBasePrice = _mealItem.basePrice;
    } else {
      _mealItem = widget.cartItem.mealItem;
      _selectedExtras = widget.cartItem.selectedExtras;
      _quantity = widget.cartItem.quantity;
      _totalExtrasPrice = widget.cartItem.getTotalExtrasPrice();
      _mealBasePrice = widget.cartItem.mealItem.basePrice;
    }
    _totalMealPrice = (_mealBasePrice + _totalExtrasPrice) * _quantity;
    super.initState();
  }

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
                    checked: getExtrasNameList(_selectedExtras),
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

                        _totalMealPrice =
                            (_mealBasePrice + _totalExtrasPrice) * _quantity;
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
        floatingActionButton: Builder(
          builder: (context) => bottomButtons(context),
        ),
        floatingActionButtonLocation:
            FloatingActionButtonLocation.miniCenterDocked,
      ),
    );
  }

  List<String> getExtrasNameList(List<ExtrasItem> selectedExtras) {
    List<String> nameList = [];
    for (ExtrasItem extraItem in selectedExtras) {
      nameList.add(extraItem.name);
    }
    return nameList;
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
                  if (_quantity != 0) {
                    _quantity--;
                    _totalMealPrice =
                        (_mealBasePrice + _totalExtrasPrice) * _quantity;
                  }
                });
              }),
          Text(
            "$_quantity",
            style: Theme.of(context)
                .textTheme
                .button
                .copyWith(color: Colors.black),
          ),
          IconButton(
              icon: Icon(Icons.add, color: Colors.black, size: 16),
              onPressed: () {
                setState(() {
                  _quantity++;
                  _totalMealPrice =
                      (_mealBasePrice + _totalExtrasPrice) * _quantity;
                });
              }),
        ],
      ),
    );
  }

  Widget addButton(BuildContext context) {
    var _cartProvider = Provider.of<CartProvider>(context);
    bool isEdit = widget.cartItem != null;
    String buttonText = isEdit ? "Update" : "Add";
    CartItem finalCartItem;

    return MaterialButton(
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 32),
      color: Theme.of(context).primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      onPressed: () {
        finalCartItem = CartItem(
          mealItem: _mealItem,
          selectedExtras: _selectedExtras,
          quantity: _quantity,
          totalMealPrice: _totalMealPrice,
        );

        if (_buttonState == 0) {
          setState(() {
            _buttonState = 1;
          });

          if (_cartProvider.safeToAdd(finalCartItem)) {
            _cartProvider.addToCartList(finalCartItem);
            Timer(Duration(milliseconds: 1500), () {
              setState(() {
                _buttonState = 2;
              });
            });

            Timer(Duration(milliseconds: 2000), () {
              Navigator.of(context).pop();
            });
          } else {
            Timer(Duration(milliseconds: 1500), () {
              setState(() {
                _buttonState = 3;
              });

              
              Scaffold.of(context).showSnackBar(new SnackBar(
                content: Text("This item is already in the cart!"),
                duration: Duration(milliseconds: 1500),
              ));
            });

            Timer(Duration(milliseconds: 4500), () {
              setState(() {
                _buttonState = 0;
              });
            });
          }
        }
      },
      child: setupAddButtonChild(buttonText),
    );
  }

  Widget setupAddButtonChild(String buttonText) {
    if (_buttonState == 0) {
      return new Text(
        "$buttonText  \$${_totalMealPrice.toStringAsFixed(2)}",
        style: Theme.of(context).textTheme.button,
      );
    } else if (_buttonState == 1) {
      return SizedBox(
        height: 20,
        width: 20,
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
        ),
      );
    } else if (_buttonState == 2) {
      return Icon(
        Icons.check,
        color: Colors.white,
        size: 20,
      );
    } else {
      return Icon(
        Icons.close,
        color: Colors.white,
        size: 20,
      );
    }
  }

  void animateButton() {
    setState(() {
      _buttonState = 1;
    });

    Timer(Duration(milliseconds: 3000), () {
      setState(() {
        _buttonState = 2;
      });
    });
  }

  List<ExtrasItem> _getSelectedExtras(List<String> checked) {
    List<ExtrasItem> temp = [];
    for (var i = 0; i < _mealItem.extrasList.length; i++) {
      if (checked.contains(_mealItem.extrasList[i].name)) {
        temp.add(_mealItem.extrasList[i]);
      }
    }
    return temp;
  }
}
