import 'package:chop_chop_flutter/data_model/extras_item.dart';
import 'package:flutter/foundation.dart';


final String _mealDescription =
    """Short description, 280 character limit, describing the meal and all the 
    ingredients involved. Opportunity to convey a message to customers 
    and sell the product""";

MealItemList mealItemList = MealItemList(mealItems: [
  MealItem(
      id: 1,
      mealName: "Beef Burger",
      restaurantName: "BBQ City",
      mealBasePrice: 15.00,
      mealImage: 'images/Burger.jpg',
      mealDescription: _mealDescription,
      estimatedDeliveryTime: 35,
      deliveryFee: 1,
      extrasList: <ExtrasItem>[
        ExtrasItem(
          id: 1,
          extrasName: "Sweet Potato Chips",
          extrasPrice: 5,
        ),
        ExtrasItem(
          id: 2,
          extrasName: "Normal Potato Chips",
          extrasPrice: 5,
        ),
        ExtrasItem(
          id: 3,
          extrasName: "Water",
          extrasPrice: 0,
        ),
      ]),
  MealItem(
      id: 2,
      mealName: "Gretaben",
      restaurantName: "PizzaMan",
      mealBasePrice: 45.00,
      mealImage: 'images/Noodles.jpg',
      mealDescription: _mealDescription,
      estimatedDeliveryTime: 30,
      deliveryFee: 2,
      extrasList: <ExtrasItem>[
        ExtrasItem(
          id: 1,
          extrasName: "Sweet Potato Chips",
          extrasPrice: 5,
        ),
        ExtrasItem(
          id: 2,
          extrasName: "Normal Potato Chips",
          extrasPrice: 5,
        ),
        ExtrasItem(
          id: 3,
          extrasName: "Kelewele",
          extrasPrice: 3,
        ),
      ]),
  MealItem(
      id: 3,
      mealName: "Pork Fried Rice",
      restaurantName: "Brunei Cafeteria",
      mealBasePrice: 13.00,
      mealImage: 'images/Rice.jpg',
      mealDescription: _mealDescription,),
  MealItem(
      id: 4,
      mealName: "Jollof with Beef",
      restaurantName: "Sweet Mummy's",
      mealBasePrice: 16.00,
      mealImage: 'images/Rice.jpg',
      mealDescription: _mealDescription,),
  MealItem(
      id: 5,
      mealName: "Fried Rice & Beef Sauce",
      restaurantName: "Husband and Wife",
      mealBasePrice: 16.00,
      mealImage: 'images/Rice.jpg',
      mealDescription: _mealDescription,),
  MealItem(
      id: 6,
      mealName: "BBQ Chicken Wings & Sweet Potato Fries",
      restaurantName: "BBQ City",
      mealBasePrice: 25.00,
      mealImage: 'images/Chicken.jfif',
      mealDescription: _mealDescription,),
  MealItem(
      id: 7,
      mealName: "Fried Chicken & Yam Chips",
      restaurantName: "Mr. Roberts",
      mealBasePrice: 12.00,
      mealImage: 'images/Chicken.jfif',
      mealDescription: _mealDescription,),
  MealItem(
      id: 8,
      mealName: "Pork & Fried Yam",
      restaurantName: "Acuzzi",
      mealBasePrice: 8.00,
      mealImage: 'images/Rice.jpg',
      mealDescription: _mealDescription,),
  MealItem(
      id: 9,
      mealName: "Jollof & Chicken",
      restaurantName: "Sanbra",
      mealBasePrice: 8.00,
      mealImage: 'images/Rice.jpg',
      mealDescription: _mealDescription,),
  MealItem(
      id: 10,
      mealName: "Fried Chicken & Yam Chips",
      restaurantName: "Mr. Roberts",
      mealBasePrice: 12.00,
      mealImage: 'images/Rice.jpg',
      mealDescription: _mealDescription,),
]);

class MealItemList {
  List<MealItem> mealItems; // A list of meal item from the class above

  MealItemList({@required this.mealItems});
}

class MealItem {
  final int id;
  final String mealImage;
  final String mealName;
  final double mealBasePrice;
  final String mealDescription;
  final String restaurantName;
  final int estimatedDeliveryTime;
  final int deliveryFee;
  final List<ExtrasItem> extrasList;

  MealItem({
    @required this.id,
    @required this.mealImage,
    @required this.mealName,
    @required this.mealBasePrice,
    @required this.mealDescription,
    this.restaurantName,
    this.estimatedDeliveryTime,
    this.deliveryFee,
    this.extrasList,
  });


  List<String> listExtrasNames() {
    List<String> extrasNames = [];
    if(extrasList == null) return extrasNames;
    for (ExtrasItem extrasItem in extrasList){
      extrasNames.add(extrasItem.extrasName);
    }
    return extrasNames;
  }

}
