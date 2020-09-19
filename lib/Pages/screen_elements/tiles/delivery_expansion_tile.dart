import 'package:chop_chop_flutter/providers/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DeliveryExpansionTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CartProvider _cartProvider = Provider.of<CartProvider>(context);

    return ExpansionTile(
      leading: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 6.0),
            child: Text(
              "Deliver To:",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
      title: Center(
          child: Text(
        "${_cartProvider.roomNumber} ${_cartProvider.hostelName}",
        style: TextStyle(fontSize: 16),
      )),
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(8),
          color: Colors.black12,
          child: Column(
            children: <Widget>[
              Container(
                  padding: EdgeInsets.fromLTRB(32, 6, 6, 4),
                  child: Row(
                    children: <Widget>[
                      Text(
                        "Hostel:",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Colors.black),
                      ),
                      SizedBox(width: 32),
                      DropdownButton<String>(
                        value: _cartProvider.hostelName,
                        onChanged: (String value) {
                          _cartProvider.setHostelName(value);
                        },
                        items: _cartProvider.hostels.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black),
                            ),
                          );
                        }).toList(),
                      ),
                    ],
                  )),
              Container(
                padding: EdgeInsets.fromLTRB(32, 8, 8, 8),
                child: Row(
                  children: <Widget>[
                    Text(
                      "Room No:",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Colors.black),
                    ),
                    SizedBox(width: 8),
                    Container(
                      width: 50,
                      child: TextField(
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                        onSubmitted: (String roomNumber) {
                          _cartProvider.setRoomNumber(roomNumber);
                        },
                        decoration: InputDecoration(
                            isDense: true,
                            hintText: _cartProvider.roomNumber,
                            hintStyle: TextStyle(color: Colors.black)),
                        textCapitalization: TextCapitalization.characters,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}