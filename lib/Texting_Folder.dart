// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import './Model/example.dart';

// class Texting extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     Example example = Example(foodName: "tastee", foodPrice: 50.0);
//     return Scaffold(
//       body: Center(
//         child: Container(
//           child: RaisedButton(
//             onPressed: () {
//               Firestore.instance.collection('product').add({
//                 "FoodNmae": example.foodName,
//                 "Foodprice": example.foodPrice,
//               });
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }
