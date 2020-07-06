import 'package:flutter/material.dart';
import './login.dart';
import 'package:carousel_pro/carousel_pro.dart';
class FirstSlide extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
              height: MediaQuery.of(context).size.height*1.0,
              width: double.infinity,
              child: Carousel(
                autoplay: true,
                animationCurve: Curves.fastOutSlowIn,
                //animationDuration: Duration(microseconds: 30),
                dotSize: 6.0,
                dotIncreasedColor:Theme.of(context).primaryColor,
                //dotColor: Colors.blue,
                dotBgColor: Colors.transparent,
                dotPosition: DotPosition.bottomCenter,
                dotVerticalPadding: 0.0,
                showIndicator: true,
                indicatorBgPadding: 7.0,
                images: [
                  Image.asset(
                    "images/slide1.jpg",
                    fit: BoxFit.cover,
                  ),
                  Image.asset(
                    "images/slide2.jpg",
                    fit: BoxFit.cover,
                  ),
                  Image.asset(
                    "images/slide3.jpg",
                    fit: BoxFit.cover,
                  ),
                ],
              )),
          Container(
            height:MediaQuery.of(context).size.height*0.9,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  height:MediaQuery.of(context).size.height*0.1-10,
                  width: MediaQuery.of(context).size.width*0.8,
                  child: RaisedButton(
                    textColor: Colors.white,
                    color: Theme.of(context).primaryColor,
                    child: Text("Skip"),
                    onPressed: () {
                       Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => Login()));
                    },
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(10.0),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
