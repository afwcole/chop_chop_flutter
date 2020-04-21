import 'package:flutter/foundation.dart';


MealItemList mealItemList = MealItemList(
    mealItems: [
      MealItem(
          id: 1,
          mealName: "Beef Burger",
          restaurantName: "BBQ City",
          price: 15.00,
          imgUrl: 'images/Burger.jpg'
      ),
      MealItem(
          id: 2,
          mealName: "Gretaben",
          restaurantName: "PizzaMan",
          price: 50.00,
          imgUrl: 'images/Noodles.jpg'
      ),
      MealItem(
          id: 3,
          mealName: "Pork Fried Rice",
          restaurantName: "Brunei Cafeteria",
          price: 13.00,
          imgUrl: 'images/Rice.jpg'
      ),
      MealItem(
          id: 4,
          mealName: "Jollof with Beef",
          restaurantName: "Sweet Mummy's",
          price: 16.00,
          imgUrl: 'images/Rice.jpg'
      ),
      MealItem(
          id: 5,
          mealName: "Fried Rice & Beef Sauce",
          restaurantName: "Husband and Wife",
          price: 16.00,
          imgUrl: 'images/Rice.jpg'
      ),
      MealItem(
          id: 6,
          mealName: "BBQ Chicken Wings & Sweet Potato Fries",
          restaurantName: "BBQ City",
          price: 25.00,
          imgUrl: 'images/Chicken.jfif'
      ),
      MealItem(
          id: 7,
          mealName: "Fried Chicken & Yam Chips",
          restaurantName: "Mr. Roberts",
          price: 12.00,
          imgUrl: 'images/Chicken.jfif'
      ),
      MealItem(
          id: 8,
          mealName: "Pork & Fried Yam",
          restaurantName: "Acuzzi",
          price: 8.00,
          imgUrl: 'images/Rice.jpg'
      ),
      MealItem(
          id: 9,
          mealName: "Jollof & Chicken",
          restaurantName: "Sanbra",
          price: 8.00,
          imgUrl: 'images/Rice.jpg'
      ),
      MealItem(
          id: 10,
          mealName: "Fried Chicken & Yam Chips",
          restaurantName: "Mr. Roberts",
          price: 12.00,
          imgUrl: 'images/Rice.jpg'
      ),
    ]
);

class MealItemList {
  List<MealItem> mealItems; // A list of meal item from the class above

  MealItemList({@required this.mealItems}); //requires the mealItems list line above
}

class MealItem{
  int id;
  String mealName;
  String restaurantName;
  double price;
  String imgUrl;

  MealItem({
    @required this.id,
    @required this.mealName,
    @required this.restaurantName,
    @required this.price,
    @required this.imgUrl
  });
}