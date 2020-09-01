import 'package:chop_chop_flutter/data_model/extras_item.dart';
import 'package:chop_chop_flutter/data_model/meal_item.dart';

final String _mealDescription =
    "Short description, 280 character limit, describing the meal and all the ingredients involved. Opportunity to convey a message to customers and sell the product";

MealItemList tempMoreChoicesList = MealItemList(mealItems: [
  MealItem(
      id: 1,
      name: "Beef Burger",
      restaurantName: "BBQ City",
      basePrice: 15.00,
      image: 'images/Burger.jpg',
      description: _mealDescription,
      estDeliveryTime: 35,
      deliveryFee: 1,
      extrasList: <ExtrasItem>[
        ExtrasItem(
          id: 1,
          name: "Sweet Potato Chips",
          price: 5,
        ),
        ExtrasItem(
          id: 2,
          name: "Normal Potato Chips",
          price: 5,
        ),
        ExtrasItem(
          id: 3,
          name: "Water",
          price: 0,
        ),
      ]),
  MealItem(
      id: 2,
      name: "Gretaben",
      restaurantName: "PizzaMan",
      basePrice: 45.00,
      image: 'images/Noodles.jpg',
      description: _mealDescription,
      estDeliveryTime: 30,
      deliveryFee: 2,
      extrasList: <ExtrasItem>[
        ExtrasItem(
          id: 1,
          name: "Sweet Potato Chips",
          price: 5,
        ),
        ExtrasItem(
          id: 2,
          name: "Normal Potato Chips",
          price: 5,
        ),
        ExtrasItem(
          id: 3,
          name: "Kelewele",
          price: 3,
        ),
      ]),
  MealItem(
    id: 3,
    name: "Pork Fried Rice",
    restaurantName: "Brunei Cafeteria",
    basePrice: 13.00,
    image: 'images/Rice.jpg',
    description: _mealDescription,
    extrasList: <ExtrasItem>[
      ExtrasItem(
        id: 1,
        name: "Sweet Potato Chips",
        price: 5,
      ),
      ExtrasItem(
        id: 2,
        name: "Normal Potato Chips",
        price: 5,
      ),
      ExtrasItem(
        id: 3,
        name: "Water",
        price: 0,
      ),
    ]),
  MealItem(
    id: 4,
    name: "Jollof with Beef",
    restaurantName: "Sweet Mummy's",
    basePrice: 16.00,
    image: 'images/Rice.jpg',
    description: _mealDescription,
    extrasList: <ExtrasItem>[
        ExtrasItem(
          id: 1,
          name: "Sweet Potato Chips",
          price: 5,
        ),
        ExtrasItem(
          id: 2,
          name: "Normal Potato Chips",
          price: 5,
        ),
        ExtrasItem(
          id: 3,
          name: "Water",
          price: 0,
        ),
      ]),
  MealItem(
    id: 9,
    name: "Banku & Tilapia",
    restaurantName: "Sanbra",
    basePrice: 8.00,
    image: 'images/Local.jpg',
    description: _mealDescription,),
  MealItem(
    id: 5,
    name: "Krabby Patty",
    restaurantName: "Husband and Wife",
    basePrice: 16.00,
    image: 'images/Burger.jpg',
    description: _mealDescription,),
  MealItem(
    id: 6,
    name: "BBQ Chicken Wings & Sweet Potato Fries",
    restaurantName: "BBQ City",
    basePrice: 25.00,
    image: 'images/Chicken.jfif',
    description: _mealDescription,),
  MealItem(
    id: 7,
    name: "Fried Chicken & Yam Chips",
    restaurantName: "Mr. Roberts",
    basePrice: 12.00,
    image: 'images/Chicken.jfif',
    description: _mealDescription,),
  MealItem(
    id: 8,
    name: "Pork & Fried Yam",
    restaurantName: "Acuzzi",
    basePrice: 8.00,
    image: 'images/Rice.jpg',
    description: _mealDescription,),
  MealItem(
    id: 10,
    name: "Fried Chicken & Yam Chips",
    restaurantName: "Mr. Roberts",
    basePrice: 12.00,
    image: 'images/Chicken.jfif',
    description: _mealDescription,),
]);