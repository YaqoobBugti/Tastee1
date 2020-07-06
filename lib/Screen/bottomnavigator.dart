// import 'package:flutter/material.dart';
// import './homepage.dart';
// class Bottomnavigator extends StatefulWidget {
//   @override
//   _BottomnavigatorState createState() => _BottomnavigatorState();
// }

// class _BottomnavigatorState extends State<Bottomnavigator> {
//   int _selectedTabIndex = 0;

//   List _pages = [
//     HomePage(),
//     Text("Search"),
//     Text("Cart"),
//     Text("Account"),
//   ];

//   _changeIndex(int index) {
//     setState(() {
//       _selectedTabIndex = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(child: _pages[_selectedTabIndex]),
//       bottomNavigationBar: BottomNavigationBar(
//         showSelectedLabels: false,
//         showUnselectedLabels: false,
//         currentIndex: _selectedTabIndex,
//         onTap: _changeIndex,
//         type: BottomNavigationBarType.fixed,
//         items: [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             title: Text("Home"),
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.search),
//             title: Text("Search"),
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.notifications_none),
//             title: Text("Cart"),
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.perm_identity),
//             title: Text("My Account"),
//           ),
//         ],
//       ),
//     );
//   }
// }
