import 'dart:convert';

import 'package:flutter/foundation.dart';

class ExtrasItem {
  final int id;
  final String name;
  final double price;

  ExtrasItem({
    @required this.id,
    @required this.name,
    @required this.price,
  });

  //FOR SERIALISATION needed for sharedPreferences of the list
  factory ExtrasItem.fromJson(Map<String, dynamic> jsonData) {
    return ExtrasItem(
      id: jsonData['id'],
      name: jsonData['name'],
      price: jsonData['price'],
    );
  }

  static Map<String, dynamic> toMap(ExtrasItem extrasItem) => {
        'id': extrasItem.id,
        'name': extrasItem.name,
        'price': extrasItem.price,
      };

  static String encodeExtrasList(List<ExtrasItem> extrasList) {
    return extrasList == null
        ? null
        : json.encode(
            extrasList
                .map<Map<String, dynamic>>(
                    (extrasItem) => ExtrasItem.toMap(extrasItem))
                .toList(),
          );
  }

  static List<ExtrasItem> decodeExtrasList(String extrasList) {
    return extrasList == null
        ? <ExtrasItem>[]
        : (json.decode(extrasList) as List<dynamic>)
            .map<ExtrasItem>((item) => ExtrasItem.fromJson(item))
            .toList();
  }
}
