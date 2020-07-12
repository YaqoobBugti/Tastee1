import 'package:flutter/material.dart';
import '../Provider/foodProvider.dart';
import 'package:foodtastee/Screen/cartscreen.dart';
import 'package:provider/provider.dart';

class DetailScreen extends StatefulWidget {
  final String image;
  final String foodName;
  final String foodsubtittle;
  final double price;

  DetailScreen({
    @required this.price,
    @required this.image,
    @required this.foodName,
    @required this.foodsubtittle,
  });

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  int count = 1;
  double totalPrice;
  FoodProvider provider;
  @override
  Widget build(BuildContext context) {
    provider = Provider.of<FoodProvider>(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Container(
                      height: 150,
                      width: double.infinity,
                      color: Color(0xfffef6fa),
                    ),
                    Container(
                      height: 120,
                      width: double.infinity,
                      color: Colors.white,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      height: 281,
                      width: double.infinity,
                      color: Colors.white,
                      child: Container(
                        height: 200,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  widget.foodName,
                                  style: TextStyle(
                                      fontSize: 35,
                                      color: Theme.of(context).primaryColor,
                                      fontWeight: FontWeight.bold),
                                ),
                                
                                Text(
                                  widget.foodsubtittle,
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 22),
                                ),
                              ],
                            ),
                            Container(
                              height: 80,
                              width: 350,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    "\$${totalPrice == null ? widget.price.toString() : totalPrice}",
                                    style: TextStyle(
                                        color: Color(0xff00d2ed), fontSize: 22),
                                  ),
                                  Container(
                                    height: 35,
                                    width: 110,
                                    decoration: BoxDecoration(
                                        color: Color(0xffebfcfe),
                                        borderRadius:
                                            BorderRadius.circular(10.0)),
                                    child: Row(
                                      children: <Widget>[
                                        Expanded(
                                          child: IconButton(
                                              icon: Icon(
                                                Icons.remove,
                                                color: Color(0xff00d2ed),
                                              ),
                                              onPressed: () {
                                                setState(() {
                                                  if (count > 1) count--;
                                                  totalPrice =
                                                      widget.price * count;
                                                });
                                              }),
                                        ),
                                        Text(
                                          "${count.toString()}",
                                          style: TextStyle(
                                              color: Color(0xff00d2ed)),
                                        ),
                                        Expanded(
                                          child: IconButton(
                                              icon: Icon(
                                                Icons.add,
                                                color: Color(0xff00d2ed),
                                              ),
                                              onPressed: () {
                                                setState(() {
                                                  count++;
                                                  totalPrice =
                                                      widget.price * count;
                                                });
                                              }),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  width: 370,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text(
                                        'Weight',
                                        style: TextStyle(
                                            fontSize: 23, color: Colors.grey),
                                      ),
                                      Text(
                                        'Mix together',
                                        style: TextStyle(
                                            fontSize: 23, color: Colors.grey),
                                      ),
                                    ],
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                      width: 375,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Text(
                                            '120kg',
                                            style: TextStyle(
                                                fontSize: 19,
                                                color: Theme.of(context)
                                                    .primaryColor,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            'milk,eggs,dip',
                                            style: TextStyle(
                                                fontSize: 23,
                                                color: Colors.grey),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                      width: 387,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Text(
                                            'Colories',
                                            style: TextStyle(
                                                fontSize: 23,
                                                color: Colors.grey),
                                          ),
                                          Text(
                                            'chicken in this',
                                            style: TextStyle(
                                                fontSize: 23,
                                                color: Colors.grey),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  width: 320,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Text(
                                            '430 ccal',
                                            style: TextStyle(
                                                fontSize: 19,
                                                color: Theme.of(context)
                                                    .primaryColor,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            'mixture',
                                            style: TextStyle(
                                                fontSize: 23,
                                                color: Colors.grey),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: 60,
                      width: double.infinity,
                      child: RaisedButton(
                        textColor: Colors.white,
                        color: Theme.of(context).primaryColor,
                        child: Text(
                          "Submit",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        onPressed: () {
                          provider.addFoodCart(
                            widget.foodName,
                            widget.foodsubtittle,
                            count,
                            widget.image,
                            totalPrice == null ? widget.price : totalPrice,
                          );
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => CartScreen(),
                            ),
                          );
                        },
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                    padding: const EdgeInsets.only(left: 90, top: 60),
                    child: CircleAvatar(
                      maxRadius: 90,
                      backgroundImage: NetworkImage(widget.image),
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
