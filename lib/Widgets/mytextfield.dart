import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
class MYTextField extends StatelessWidget {
  final String hintText;
  final bool obscuretext;
  final TextInputType keyboard;
  final TextEditingController controller;
  MYTextField({this.hintText,this.controller,this.obscuretext,this.keyboard});
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboard,
      controller: controller,
      obscureText: obscuretext,
      decoration: InputDecoration(
        filled: true,
        fillColor: Color(0xfffef6fa),
        border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(10)),
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.grey,fontSize: 22),
      ),
    );
  }
}