import 'package:flutter/material.dart';
import './homescreen.dart';
import '../Widgets/circlecontainer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../Model/food.dart';

class Catagory extends StatefulWidget {
  @override
  _CatagoryState createState() => _CatagoryState();
}

class _CatagoryState extends State<Catagory> {
  Food pastaFood;
  Food chickenFood;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "Piza",
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => HomeScreen()));
            }),
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.shopping_cart,
                color: Colors.black,
              ),
              onPressed: () {})
        ],
      ),
      body: StreamBuilder(
        stream: Firestore.instance
            .collection("catagory")
            .document('vegetable')
            .collection("pasta Cheese")
            .snapshots(),
        builder: (contact, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          pastaFood = Food(
            price: snapshot.data.documents[0]['price'],
            image: snapshot.data.documents[0]['image'],
            foodsubTittle: snapshot.data.documents[0]['foodsubTittle'],
            foodName: snapshot.data.documents[0]['foodName'],
            ratting: snapshot.data.documents[0]['ratting'],
          );
          return StreamBuilder(
            stream: Firestore.instance
                .collection("catagory")
                .document('vegetable')
                .collection("Chicken")
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              chickenFood = Food(
                price: snapshot.data.documents[0]['price'],
                image: snapshot.data.documents[0]['image'],
                foodsubTittle: snapshot.data.documents[0]['foodsubTittle'],
                foodName: snapshot.data.documents[0]['foodName'],
                ratting: snapshot.data.documents[0]['ratting'],
              );
              return ListView(
                children: <Widget>[
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                                                  child: Row(
                            children: <Widget>[
                              CircleContainer(
                                image: pastaFood.image,
                                text: pastaFood.foodName,
                                subtext: pastaFood.foodsubTittle,
                                price: pastaFood.price,
                                ratting: pastaFood.ratting,
                              ),
                              CircleContainer(
                                image: chickenFood.image,
                                text: chickenFood.foodName,
                                subtext: chickenFood.foodsubTittle,
                                price: chickenFood.price,
                                ratting: chickenFood.ratting,
                                onPress: () {},
                              ),
                            ],
                          ),
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                                                  child: Row(
                            children: <Widget>[
                              CircleContainer(
                                image: pastaFood.image,
                                text: pastaFood.foodName,
                                subtext: pastaFood.foodsubTittle,
                                price: pastaFood.price,
                                ratting: pastaFood.ratting,
                              ),
                              CircleContainer(
                                image: chickenFood.image,
                                text: chickenFood.foodName,
                                subtext: chickenFood.foodsubTittle,
                                price: chickenFood.price,
                                ratting: chickenFood.ratting,
                                onPress: () {},
                              ),
                            ],
                          ),
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                                                  child: Row(
                            children: <Widget>[
                              CircleContainer(
                                image: pastaFood.image,
                                text: pastaFood.foodName,
                                subtext: pastaFood.foodsubTittle,
                                price: pastaFood.price,
                                ratting: pastaFood.ratting,
                              ),
                              CircleContainer(
                                image: chickenFood.image,
                                text: chickenFood.foodName,
                                subtext: chickenFood.foodsubTittle,
                                price: chickenFood.price,
                                ratting: chickenFood.ratting,
                                onPress: () {},
                              ),
                            ],
                          ),
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                                                  child: Row(
                            children: <Widget>[
                              CircleContainer(
                                image: pastaFood.image,
                                text: pastaFood.foodName,
                                subtext: pastaFood.foodsubTittle,
                                price: pastaFood.price,
                                ratting: pastaFood.ratting,
                              ),
                              CircleContainer(
                                image: chickenFood.image,
                                text: chickenFood.foodName,
                                subtext: chickenFood.foodsubTittle,
                                price: chickenFood.price,
                                ratting: chickenFood.ratting,
                                onPress: () {},
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
