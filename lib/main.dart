import 'package:flutter/material.dart';
import 'package:foodtastee/Provider/foodProvider.dart';
import 'package:foodtastee/Screen/homescreen.dart';
import 'package:foodtastee/Screen/login.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:provider/provider.dart';
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
    return ChangeNotifierProvider(
      create: (context)=>FoodProvider(),
      child: MaterialApp(
        theme: ThemeData(
          accentColor: Color(0xff758085),
          primaryColor: Color(0xfff05c18),
        ),

        debugShowCheckedModeBanner: false,
        // home:SignUp(),
        home: StreamBuilder(
            stream: FirebaseAuth.instance.onAuthStateChanged,
            builder: (ctx, userSnapshot) {
              if(userSnapshot.hasData){
                return HomeScreen();
              }
              return Login();
            }),
      ),
    );
  }
}
