import 'dart:convert';

import 'package:flutter/foundation.dart';

void main() {
  final String encodedData = Music.encodeMusics([
    Music(id: 1),
    Music(id: 2),
    Music(id: 3),
  ]);

  final List<Music> decodedData = Music.decodeMusics(encodedData);
  for(var music in decodedData){
    print(music.id);
  }

}

class CartItem {
  final int id;
  final int quantity;
  final double totalMealPrice;

  CartItem({
    this.id,
    @required this.quantity,
    @required this.totalMealPrice,
  });

  factory CartItem.fromJson(Map<String, dynamic> jsonData) {
    return CartItem(
      id: jsonData['id'],
      quantity: jsonData['quantity'],
      totalMealPrice: jsonData['totalMealPrice'],
    );
  }

  static Map<String, dynamic> toMap(CartItem cartItem) =>
      {
        'id': cartItem.id,
        'quantity': cartItem.quantity,
        'totalMealPrice': cartItem.totalMealPrice,
      };

  static String encodeCartList(List<CartItem> cartList) =>
      json.encode(
        cartList
            .map<Map<String, dynamic>>((cartItem) => CartItem.toMap(cartItem))
            .toList(),
      );

  static List<CartItem> decodeCartList(String cartList) =>
      (json.decode(cartList) as List<dynamic>)
          .map<CartItem>((item) => CartItem.fromJson(item))
          .toList();
}

class Music {
  final int id;
  final String name, size, rating, duration, img;
  bool favorite;

  Music({
    this.id,
    this.rating,
    this.size,
    this.duration,
    this.name,
    this.img,
    this.favorite,
  });

  factory Music.fromJson(Map<String, dynamic> jsonData) {
    return Music(
      id: jsonData['id'],
      rating: jsonData['rating'],
      size: jsonData['size'],
      duration: jsonData['duration'],
      name: jsonData['name'],
      img: jsonData['img'],
      favorite: false,
    );
  }

  static Map<String, dynamic> toMap(Music music) =>
      {
        'id': music.id,
        'rating': music.rating,
        'size': music.size,
        'duration': music.duration,
        'name': music.name,
        'img': music.img,
        'favorite': music.favorite,
      };

  static String encodeMusics(List<Music> musics) =>
      json.encode(
        musics
            .map<Map<String, dynamic>>((music) => Music.toMap(music))
            .toList(),
      );

  static List<Music> decodeMusics(String musics) =>
      (json.decode(musics) as List<dynamic>)
          .map<Music>((item) => Music.fromJson(item))
          .toList();
}