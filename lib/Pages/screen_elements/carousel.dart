import 'package:chop_chop_flutter/custom_scroll_physics.dart';
import 'package:chop_chop_flutter/pages/screen_elements/cards/meal_card.dart';
import 'package:chop_chop_flutter/pages/screen_elements/cards/restuarant_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Carousel extends StatefulWidget {
  final String deckTitle;
  final List itemList;
  final bool isMealCard;

  Carousel(
      {Key key,
      @required this.deckTitle,
      @required this.itemList,
      @required this.isMealCard,})
      : super(key: key);

  @override
  _CarouselState createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  String _deckTitle;
  List _itemList;
  bool _isMealCard;
  final _controller = ScrollController();
  List pages;
  ScrollPhysics _physics;

  @override
  void initState() {
    super.initState();
    _deckTitle = widget.deckTitle;
    _itemList = widget.itemList;
    pages = _itemList;
    _isMealCard = widget.isMealCard;

    _controller.addListener(() {
      if (_controller.position.haveDimensions && _physics == null) {
        setState(() {
          var dimension =
              _controller.position.maxScrollExtent / (pages.length - 1);
          _physics = CustomScrollPhysics(itemDimension: dimension);
        });
      }
    });
  }

  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          alignment: Alignment.centerLeft,
          margin: EdgeInsets.only(left: 16),
          child: Text(
            _deckTitle,
            style: Theme.of(context).textTheme.subhead,
          ),
        ),
        SizedBox(height: 8),
        Container(
          height: _isMealCard ? 220 : 158, //different sizes required to not crop the corresponding cards.
          child: ListView.builder(
            controller: _controller,
            physics: _physics,
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: 8),
            itemCount: pages.length,
            itemBuilder: (BuildContext context, int index) {
              if (_isMealCard) {
                return Center(
                  child: MealCard(
                    mealItem: _itemList[index],
                  ),
                );
              }
              else {
                return Center(
                  child: RestaurantCard(
                    restaurantItem: _itemList[index],
                  ),
                );
              }
            },
          ),
        ),
      ],
    );
  }
}
