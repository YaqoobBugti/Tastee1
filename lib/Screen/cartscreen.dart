import 'package:flutter/material.dart';
import 'package:foodtastee/Provider/foodProvider.dart';
import 'package:provider/provider.dart';
import './homescreen.dart';
import "../Widgets/Button.dart";

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  double total = 0.0;
  FoodProvider provider;
  Widget container(BuildContext context, int myIndex) {
    var allFoodCart = provider.getFoodCart;

    return Dismissible(
      key: UniqueKey(),
      onDismissed: (rovider) {
        setState(() {
          provider.delete(myIndex);
          total -=allFoodCart[myIndex].foodPrice;
          // var pricepeice = provider.foodcardlist;
          // pricepeice.forEach((element) {
          //   total -= element.foodPrice;
          // });
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        height: 75,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            color: Color(0xffffffff),
            borderRadius: BorderRadius.circular(10.0)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              height: double.infinity,
              width: 130,
              // color: Colors.yellow,
              child: Row(
                children: <Widget>[
                  CircleAvatar(
                    maxRadius: 30,
                    backgroundImage:
                        NetworkImage(allFoodCart[myIndex].foodImage),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5,),
                    child: Text(
                      "${allFoodCart[myIndex].foodQuantity.toString()}x",
                      style: TextStyle(color: Colors.grey, fontSize: 20),
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: double.infinity,
              width: 120,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    allFoodCart[myIndex].foodName,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Text(allFoodCart[myIndex].foodType),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(),
              height: 50,
              width: 80,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text(
                    "\$${allFoodCart[myIndex].foodPrice}",
                    style: TextStyle(
                      color: Color(0xff04d4ee),
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    provider = Provider.of<FoodProvider>(context, listen: false);
    var pricepeice = provider.foodcardlist;
    pricepeice.forEach((element) {
      total += element.foodPrice;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // provider = Provider.of<FoodProvider>(context);
    // var pricepeice = provider.foodcardlist;
    // pricepeice.forEach((element) {
    //   total += element.foodPrice;
    // });
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Color(0xffffffff),
        centerTitle: true,
        title: Text(
          "Cart",
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
          },
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 4,
            child: Container(
              child: ListView.builder(
                itemBuilder: container,
                itemCount: provider.foodCartLength,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              color: Theme.of(context).primaryColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    //color: Colors.black,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Total",
                          style: TextStyle(fontSize: 22, color: Colors.white),
                        ),
                        Text(
                          "\$ $total",
                          style: TextStyle(fontSize: 22, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  Button(
                    buttoncolors: Colors.white,
                    textcolor: Theme.of(context).primaryColor,
                    tittle: "Submit",
                    whenpress: () {},
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
