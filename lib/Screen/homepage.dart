import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';

class HomePage extends StatelessWidget {
  Widget horizontalContainer({String image, String text}) {
    return Stack(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 30),
          child: Container(
            margin: EdgeInsets.only(right: 10),
            // margin: EdgeInsets.symmetric(
            //   horizontal: 10,
            // ),
            height: 120,
            width: 90,
            child: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Center(
                  child: Text(
                text,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              )),
            ),
            decoration: BoxDecoration(
                color: Color(0xffffde6f0),
                borderRadius: BorderRadius.circular(10)),
          ),
        ),
        Padding(
            padding: const EdgeInsets.only(left: 15),
            child: CircleAvatar(
              maxRadius: 30,
              backgroundColor: Colors.white,
              child: Image.asset(image),
            )),
      ],
    );
  }

  Widget verticalContainer(
      {String photo, String tittle, String subtittle, int price}) {
    return Stack(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 100, right: 20),
          child: Container(
            height: 60,
            width: 150,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 16, bottom: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        tittle,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(subtittle),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 16, bottom: 5),
                  child: Text(
                    "\$ ${price.toString()}",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 15, top: 35),
          child: Container(
            height: 85,
            width: 120,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(photo.toString()), fit: BoxFit.cover),
                color: Colors.green,
                borderRadius: BorderRadius.circular(10.0)),
          ),
        ),
      ],
    );
  }

  Widget salidar() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      height: 200,
      child: Carousel(
        autoplay: true,
        animationCurve: Curves.fastOutSlowIn,
        dotSize: 6.0,
        dotIncreasedColor: Colors.pink,
        dotBgColor: Colors.transparent,
        dotPosition: DotPosition.bottomCenter,
        dotVerticalPadding: 0.0,
        showIndicator: true,
        indicatorBgPadding: 7.0,
        images: [
          ExactAssetImage("images/third.jpg"),
          ExactAssetImage("images/newfood.jpg"),
          ExactAssetImage("images/second.jpg"),
        ],
      ),
    );
  }

  Widget location() {
    return Container(
      height: 70,
      padding: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Color(0xffffde6f0),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Location"),
              Text(
                "Sui",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          IconButton(icon: Icon(Icons.location_on), onPressed: null)
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          "Home",
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          tooltip: 'Previous choice',
          icon: const Icon(
            Icons.storage,
            color: Colors.black,
          ),
          onPressed: () {},
        ),
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.shopping_cart,
                color: Colors.black,
              ),
              onPressed: null)
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 10,
        ),
        child: ListView(
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            location(),
            salidar(),
            Text(
              "Select by Category",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            SizedBox(
              height: 10,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: <Widget>[
                  horizontalContainer(text: "Meat", image: "images/cat.png"),
                  horizontalContainer(text: "Patato", image: "images/a.png"),
                  horizontalContainer(text: "Rice", image: "images/aa.png"),
                  horizontalContainer(text: "Orange", image: "images/bb.png"),
                  horizontalContainer(text: "Cake", image: "images/cc.png"),
                  horizontalContainer(
                      text: "Apple", image: "images/orange.png"),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 20),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "axha",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "theek",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: <Widget>[
                        verticalContainer(tittle: "Meat",subtittle: "Meat Acha",photo: "images/third.jpg",price: 24),
                        verticalContainer(tittle: "Patato",subtittle: "Patato Acha",photo: "images/newfood.jpg",price: 23),
                        verticalContainer(tittle: "Orange",subtittle: "OrangeAcha",photo: "images/second.jpg",price: 30),
                      ],
                    ),
                    
                  ),
                   SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: <Widget>[
                        verticalContainer(tittle: "Meat",subtittle: "Meat Acha",photo: "images/third.jpg",price: 24),
                        verticalContainer(tittle: "Patato",subtittle: "Patato Acha",photo: "images/newfood.jpg",price: 23),
                        verticalContainer(tittle: "Orange",subtittle: "OrangeAcha",photo: "images/second.jpg",price: 30),
                      ],
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
}
