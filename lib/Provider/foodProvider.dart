import 'package:flutter/cupertino.dart';
import 'package:foodtastee/Model/food.dart';
import '../Model/foodcart.dart';

class FoodProvider with ChangeNotifier {
  List<FoodCart> foodcardlist = [];
  FoodCart foodcart;
   List<Food> foodList = [];
  void addFoodCart(
    String foodName,
    String foodType,
    int foodQuntites,
    String foodImage,
    double foodPrice,
  ){
    foodcart = FoodCart(
        foodName: foodName,
        foodQuantity: foodQuntites,
        foodPrice: foodPrice,
        foodType: foodType,
        foodImage: foodImage);
    foodcardlist.add(foodcart);
  }

    void addFoodList({
    String foodName,
    String foodType,
    String foodimage,
    double foodprice,
  }) {}


  List<FoodCart> get getFoodCart {
    return List.from(foodcardlist);
  }

  int get foodCartLength {

    return foodcardlist.length;
  }
  void delete(int index){
    foodcardlist.removeAt(index);
    notifyListeners();
  }
    List<Food> get getfoodList {
    return foodList;
  }
  List<Food> get getMyFoodList {
    return foodList;
  }
}
