import 'package:flutter/material.dart';

class Food {
  String foodName;
  String foodsubTittle;
  double ratting;
  String image;
  double price;
  Food(
    { @required this.price,
      @required this.image,
      @required this.foodsubTittle,
      @required this.foodName,
      @required this.ratting});
    }