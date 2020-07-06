import 'package:flutter/material.dart';
import './homescreen.dart';
import "../Widgets/Button.dart";

class CartScreen extends StatelessWidget {
  Widget container() {
    return Container(
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
                  backgroundImage: AssetImage("images/pasta.jpg"),
                ),
                SizedBox(
                  width: 30,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5, left: 5),
                  child: Text(
                    "1x",
                    style: TextStyle(color: Colors.grey, fontSize: 20),
                  ),
                )
              ],
            ),
          ),
          Container(
            height: double.infinity,
            width: 130,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(
                  "Pasta cheese",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                Text("7 oceans Hotel"),
              ],
            ),
          ),
          Container(
              padding: EdgeInsets.only(right: 10),
              height: 50,
              width: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text(
                    "\$50",
                    style: TextStyle(
                        color: Color(0xff04d4ee),
                        fontWeight: FontWeight.bold,
                        fontSize: 25),
                  )
                ],
              )),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
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
               Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => HomeScreen()));
            }),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 4,
            child: Container(
              child: ListView( 
                children: <Widget>[
                  container(),
                  container(),
                  container(),
                  container(),
                  container(),
                  container(),
                  container(),
                  container(),
                  container(),
                ],
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
                          "\$360",
                          style: TextStyle(fontSize: 22, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  Button(
                    buttoncolors:Colors.white,
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
