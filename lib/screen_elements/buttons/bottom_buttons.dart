import 'package:flutter/material.dart';

class BottomButtons extends StatefulWidget{
  final double price;

  BottomButtons({@required this.price});

  @override
  State<StatefulWidget> createState() => _BottomButtonsState(mealPrice: price);

}

class _BottomButtonsState extends State<BottomButtons> {

  int _counter = 1;
  double mealPrice;
  double _displayFinalPrice;

  _BottomButtonsState({@required this.mealPrice});

  void _incrementCounter() {
    setState(() {
      _counter++;
      _displayFinalPrice = mealPrice * _counter;
    });
  }

  void _decrementCounter() {
    setState(() {
      if (_counter != 0) {
        _counter--;
        _displayFinalPrice = mealPrice * _counter;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
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
                _decrementCounter();
              }),
          Text("$_counter",
            style: Theme.of(context).textTheme.button.copyWith(color: Colors.black),
          ),
          IconButton(
              icon: Icon(Icons.add, color: Colors.black, size: 16),
              onPressed: () {
                _incrementCounter();
              }),
        ],
      ),
    );
  }

  Widget addButton(BuildContext context) {
    if(_displayFinalPrice == null){
      _displayFinalPrice = mealPrice;
    }

    return RaisedButton(
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 32),
      color: Theme
          .of(context)
          .primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      onPressed: () {},
      child: Text(
        "Add  \$${_displayFinalPrice.toStringAsFixed(2)}",
        style: Theme.of(context).textTheme.button,
      ),
    );
  }
}