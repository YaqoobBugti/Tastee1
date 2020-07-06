import 'package:flutter/material.dart';

class FoodCart {
  final String foodImage;
  final int foodQuantity;
  final String foodName;
  final String foodType;
  final double foodPrice;
  FoodCart(
      {@required this.foodName,
      @required this.foodType,
      @required this.foodImage,
      @required this.foodPrice,
      @required this.foodQuantity});
}
