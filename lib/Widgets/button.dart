import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  
  final String tittle;
  final Color textcolor;
  final  Color buttoncolors;
  final Function whenpress;
  
  Button({this.tittle,this.textcolor,this.buttoncolors,this.whenpress});
   
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: double.infinity,
      child: RaisedButton(
        textColor:textcolor,
        color:buttoncolors,
        child: Text(
          tittle,
          style: TextStyle(fontSize: 22),
        ),
        onPressed:whenpress,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
