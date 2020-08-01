import "package:flutter/material.dart";
class CircleContainer extends StatelessWidget {
  final String text;
  final String subtext;
  final double price;
  final String image;
  final double ratting;
  final Function onPress;
  CircleContainer({this.ratting,this.image, this.price, this.subtext, this.text, this.onPress ,BuildContext context});
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        GestureDetector(
          onTap: onPress,
          child: Container(
            margin: EdgeInsets.symmetric(horizontal:20, vertical: 20),
            height: 180,
            width: 170,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  //spreadRadius: 10,
                  blurRadius: 20,
                  offset: Offset(0, 1), // changes position of shadow
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 10,left: 2),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 7),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          text,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 17),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(subtext),
                      ],
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                        child: Icon(
                          Icons.star,
                          color: Color(0xfffac330),
                        ),
                      ),
                      Text(ratting.toString()),
                      SizedBox(
                      width: 4,
                      ),
                      Text("Reathings"),
                      SizedBox(
                        height: 30,
                        width: 10,
                      ),
                      Text(
                        "\$ ${price.toString()}",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: onPress,
          child: Padding(
            padding: EdgeInsets.only(left: 85, bottom: 29),
            child: CircleAvatar(
              backgroundImage: NetworkImage(image),
              maxRadius: 50,
            ),
          ),
        ),
      ],
    );
  }
}
