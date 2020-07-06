import 'package:flutter/material.dart';
import 'package:foodtastee/Screen/homescreen.dart';
import 'package:foodtastee/Screen/login.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // SystemChrome.setSystemUIOverlayStyle(
    //   SystemUiOverlayStyle(
    //     statusBarBrightness: Brightness.light,
    // // navigation bar color
    //       statusBarColor: Color(0xffffffff) // status bar color
    //       ),
    // );
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Color(0xffff3ea5),
      ),
      debugShowCheckedModeBanner: false,
  
      home: StreamBuilder(
          stream: FirebaseAuth.instance.onAuthStateChanged,
          builder: (ctx, userSnapshot) {
            if(userSnapshot.hasData){
              return HomeScreen();
            }
            return Login();
          }),
    );
  }
}
