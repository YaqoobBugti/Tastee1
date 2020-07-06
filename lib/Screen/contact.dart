import 'package:flutter/material.dart';
import '../Widgets/mytextfield.dart';
import '../Widgets/Button.dart';

class Contact extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          "Contact",
          style: TextStyle(color: Colors.black, fontSize: 30),
        ),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 40, horizontal: 20),
        child: Column(
          children: <Widget>[
            Container(
              height: 360,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  MYTextField(hintText: "Full Name"),
                  MYTextField(hintText: "Email"),
                  MYTextField(hintText: "Pasword"),
                  MYTextField(hintText: "Your Message"),
                ],
              ),
            ),
            Container(
              height: 20,
            ),
            Button(
              buttoncolors: Theme.of(context).primaryColor,
              textcolor: Colors.white,
              tittle: "Send",
              whenpress: () {},
            )
          ],
        ),
      ),
    );
  }
}
