import 'package:flutter/cupertino.dart';
import '../Model/foodcart.dart';

class FoodProvider with ChangeNotifier {
  List<FoodCart> foodcardlist = [];
  FoodCart foodcart;
  void addFoodCart(
    String foodName,
    String foodType,
    int foodQuntites,
    String foodImage,
    double foodPrice,
  ) {
    foodcart = FoodCart(
       foodName: foodName,
       foodQuantity: foodQuntites,
        foodPrice: foodPrice,
        foodType: foodType,
        foodImage: foodImage);
        foodcardlist.add(foodcart);
  }
  List<FoodCart> get getFoodCart {
    return List.from(foodcardlist);
  } 
  int get foodCartLength {
    return foodcardlist.length;
  }
}
