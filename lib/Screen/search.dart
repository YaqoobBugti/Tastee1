import 'package:flutter/material.dart';
import 'package:foodtastee/Model/food.dart';
import 'package:foodtastee/Provider/foodProvider.dart';
import 'package:foodtastee/Widgets/circlecontainer.dart';
import 'package:provider/provider.dart';

class Search extends SearchDelegate<Food> {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query ="";
          }),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: Icon(
          Icons.arrow_back,
        ),
        onPressed: () {
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    FoodProvider provider = Provider.of<FoodProvider>(context, listen: false);
    var search = provider.getMyFoodList;
    final result =
        search.where((s) => s.foodName.toLowerCase().contains(query));

    return GridView.count(
        childAspectRatio: 0.87,
        crossAxisCount: 2,
        padding: EdgeInsets.only(top: 10),
        children: result
            .map<Widget>((e) => CircleContainer(
                  context: context,
                  image: e.image,
                  onPress: () {},
                  price: e.price,
                  ratting: e.ratting,
                  subtext: e.foodsubTittle,
                  text: e.foodName,
                ))
            .toList());
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    FoodProvider provider = Provider.of<FoodProvider>(context, listen: false);
    var search = provider.getMyFoodList;
    final result =
        search.where((s) => s.foodName.toLowerCase().contains(query));

    return GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 0.85,
        crossAxisSpacing: 0.1,
        mainAxisSpacing: 2,
        padding: EdgeInsets.only(top: 10),
        children: result
            .map<Widget>((e) => CircleContainer(
                  context: context,
                  image: e.image,
                  onPress: () {},
                  price: e.price,
                  ratting: e.ratting,
                  subtext: e.foodsubTittle,
                  text: e.foodName,
                ))
            .toList());
  }
}
