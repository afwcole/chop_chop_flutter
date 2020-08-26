import 'package:chop_chop_flutter/data_model/meal_item.dart';
import 'package:flutter/foundation.dart';

final String _restaurantDescription =
"""Short description, 280 character limit, describing the meal and all the 
ingredients involved. Opportunity to convey a message to customers 
and sell the product""";

RestaurantItemList restaurantItemList = RestaurantItemList(restaurantItems: [
  RestaurantItem(
    id: 1,
    restaurantHeaderImage: 'images/Noodles.jpg',
    restaurantLogo: 'images/Logo.png',
    restaurantName: "Hungry Man Foods",
    restaurantDescription: _restaurantDescription,
    estimatedDeliveryTime: 30,
    deliveryFee: 1,
    restaurantMenu: <MealItem>[
      MealItem(
        id: 7,
        mealName: "Fried Chicken & Yam Chips",
        restaurantName: "Mr. Roberts",
        mealBasePrice: 12.00,
        mealImage: 'images/Chicken.jfif',
        mealDescription: _restaurantDescription,),
      MealItem(
        id: 8,
        mealName: "Pork & Fried Yam",
        restaurantName: "Acuzzi",
        mealBasePrice: 8.00,
        mealImage: 'images/Rice.jpg',
        mealDescription: _restaurantDescription,),
      MealItem(
          id: 1,
          mealName: "Beef Burger",
          restaurantName: "BBQ City",
          mealBasePrice: 15.00,
          mealImage: 'images/Burger.jpg',
          mealDescription: _restaurantDescription,
          estimatedDeliveryTime: 35,
          deliveryFee: 1),
      MealItem(
          id: 2,
          mealName: "Gretaben",
          restaurantName: "PizzaMan",
          mealBasePrice: 45.00,
          mealImage: 'images/Noodles.jpg',
          mealDescription: _restaurantDescription,
          estimatedDeliveryTime: 30,
          deliveryFee: 2),
    ],
  ),
]);

class RestaurantItemList {
  List<RestaurantItem> restaurantItems; // A list of meal item from the class above

  RestaurantItemList({@required this.restaurantItems}); //requires the mealItems list line above
}

class RestaurantItem {
  final int id;
  final String restaurantHeaderImage;
  final String restaurantLogo;
  final String restaurantName;
  final String restaurantDescription;
  final int estimatedDeliveryTime;
  final int deliveryFee;
  List<MealItem> restaurantMenu;
  String restaurantContactNumber;

  RestaurantItem({
    @required this.id,
    @required this.restaurantHeaderImage,
    @required this.restaurantLogo,
    @required this.restaurantName,
    @required this.restaurantDescription,
    @required this.estimatedDeliveryTime,
    @required this.deliveryFee,
    this.restaurantMenu,
    this.restaurantContactNumber,
  });
}
