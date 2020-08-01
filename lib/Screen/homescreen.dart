import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:foodtastee/Provider/foodProvider.dart';
import 'package:foodtastee/Screen/search.dart';
import 'package:provider/provider.dart';
import './cartscreen.dart';
import './catagory.dart';
import './profile.dart';
import '../Widgets/circlecontainer.dart';
import './detailscreen.dart';
import './about.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../Model/food.dart';

class HomeScreen extends StatefulWidget {
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  
  Food foodpasta;
  Food foodchicken;
  Food searchFood;

  var uid;
  var userImage;

  Widget container({String image, String tittle, Function onClick, context}) {
    return Padding(
      padding: EdgeInsets.only(top: 60),
      child: GestureDetector(
        onTap: onClick,
        child: Container(
          margin: EdgeInsets.only(right: 10, left: 10),
          height: 150,
          width: 130,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 2,
                blurRadius: 3,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                child: Image.asset(image, width: 70),
              ),
              SizedBox(
                height: 20,
              ),
              Text(tittle,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22)),
            ],
          ),
        ),
      ),
    );
  }

  Widget draver({IconData icon, String tittle, Function whenpress, context}) {
    return Container(
      margin: EdgeInsets.only(
        left: 15,
        right: 15,
      ),
      height: MediaQuery.of(context).size.height * 0.1 - 5,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: ListTile(
        onTap: whenpress,
        leading: Icon(icon),
        title: Padding(
          padding: EdgeInsets.only(
              left: MediaQuery.of(context).viewPadding.left + 30),
          child: Text(
            tittle,
            style: TextStyle(fontSize: 19),
          ),
        ),
      ),
    );
  }

  void inputData() async {
    FirebaseUser user = await FirebaseAuth.instance.currentUser();
    uid = user.uid;
  }

  Widget search() {
    return Positioned(
      top: 160,////////////
      left: 20,
      right: 20,
      child: GestureDetector(
        onTap: () {
          showSearch(
            context: context,
            delegate: Search(),
          );
        },
        child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            height: 60,
            //width: 100,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10.0)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Search",
                  style: TextStyle(fontSize: 20),
                ),
                Icon(Icons.search),
              ],
            )
            // child: TextField(
            //   decoration: InputDecoration(
            //     suffixIcon: IconButton(
            //       onPressed: () {
            //         showSearch(
            //                 context: context, delegate: Search());
            //       },
            //       icon: Icon(Icons.search),
            //       color: Theme.of(context).primaryColor,
            //     ),
            //     hintText: 'Want to search anything',
            //     filled: true,
            //     fillColor: Colors.white,
            //     enabledBorder: OutlineInputBorder(
            //         borderRadius: BorderRadius.all(Radius.circular(10.0)),
            //         borderSide: BorderSide.none),
            //     focusedBorder: OutlineInputBorder(
            //         borderRadius: BorderRadius.all(Radius.circular(10.0)),
            //         borderSide: BorderSide.none),
            //   ),
            // ),
            ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    FoodProvider provider = Provider.of<FoodProvider>(context, listen: false);
    Firestore.instance.collection("food").snapshots().forEach((element) {
      element.documents.forEach((element) {
        searchFood = Food(
            ratting: element["rating"],
            image: element["image"],
            foodName: element["foodName"],
            price: element["foodPrice"],
            foodsubTittle: element["foodsubTittle"]);
        provider.getfoodList.add(searchFood);
        print(element['ratting']);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    
    inputData();
    return Scaffold(
      drawer: Drawer(
        child: SafeArea(
          child: Container(
            color: Color(0xfff8f8f8),
            child: Column(
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height * 0.1,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(width: 1.0, color: Colors.grey),
                      ),
                      color: Colors.white),
                  child: Center(
                      child: Text(
                    "Tastee",
                    style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 30),
                  )),
                ),
                draver(
                  context: context,
                  icon: Icons.home,
                  tittle: "Home",
                  whenpress: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => HomeScreen()));
                  },
                ),
                draver(
                  context: context,
                  icon: Icons.add_shopping_cart,
                  tittle: "Cart",
                  whenpress: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => CartScreen()));
                  },
                ),
                draver(
                    context: context,
                    icon: Icons.location_on,
                    tittle: "Address"),
                draver(
                    context: context,
                    icon: Icons.notifications,
                    tittle: "Notification"),
                draver(
                  context: context,
                  icon: Icons.perm_identity,
                  tittle: "Profile",
                  whenpress: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => Profile()));
                  },
                ),
                draver(
                    context: context,
                    icon: Icons.perm_identity,
                    tittle: "Order"),
                draver(
                  context: context,
                  icon: Icons.info_outline,
                  tittle: "About",
                  whenpress: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) => About()));
                  },
                ),
                draver(context: context, icon: Icons.call, tittle: "Contact"),
                draver(
                  context: context,
                  icon: Icons.exit_to_app,
                  tittle: "Logout",
                  whenpress: () {
                    FirebaseAuth.instance.signOut();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Theme.of(context).primaryColor,
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.notifications,
                size: 33,
              ),
              onPressed: () {})
        ],
      ),
      body: StreamBuilder(
        stream: Firestore.instance.collection("food").snapshots(),
        builder: (contact, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          foodpasta = Food(
            price: snapshot.data.documents[1]['foodPrice'],
            image: snapshot.data.documents[1]['image'],
            foodsubTittle: snapshot.data.documents[1]['foodsubTittle'],
            foodName: snapshot.data.documents[1]['foodName'],
            ratting: snapshot.data.documents[1]['ratting'],
          );

          return StreamBuilder(
            stream: Firestore.instance.collection("food").snapshots(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              foodchicken = Food(
                price: snapshot.data.documents[0]['foodPrice'],
                image: snapshot.data.documents[0]['image'],
                foodsubTittle: snapshot.data.documents[0]['foodsubTittle'],
                foodName: snapshot.data.documents[0]['foodName'],
                ratting: snapshot.data.documents[0]['ratting'],
              );
              return StreamBuilder(
                stream: Firestore.instance.collection("user").snapshots(),
                builder: (context, snapShot) {
                  if (snapShot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  var myDocuments = snapShot.data.documents;
                  myDocuments.forEach((checkDocument) {
                    if (uid == checkDocument["userId"]) {
                      userImage = checkDocument["imageUrl"];
                    }
                  });

                  return Stack(
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Expanded(
                            child: Container(
                              width: double.infinity,
                              color: Theme.of(context).primaryColor,
                              child: Container(
                                child: Container(
                                  margin: EdgeInsets.only(bottom: 50),
                                  padding: EdgeInsets.symmetric(horizontal: 20),
                                  // color: Colors.red,
                                  child: Row(
                                    children: <Widget>[
                                      CircleAvatar(
                                        maxRadius: 50,
                                        backgroundColor: Colors.white,
                                        child: CircleAvatar(
                                          maxRadius: 46,
                                          backgroundImage:
                                              NetworkImage(userImage),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            "Have you upset",
                                            style: TextStyle(
                                                fontSize: 22,
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            height: MediaQuery.of(context)
                                                    .viewPadding
                                                    .top *
                                                0.2,
                                          ),
                                          Text(
                                            "stomatch?",
                                            style: TextStyle(
                                                fontSize: 22,
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: SingleChildScrollView(
                              child: Container(
                                color: Color(0xfff2f2f2),
                                width: double.infinity,
                                child: Column(
                                  children: <Widget>[
                                    SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                        children: <Widget>[
                                          container(
                                              context: context,
                                              image: "images/pizza.png",
                                              tittle: "Pizza",
                                              onClick: () {
                                                Navigator.of(context).push(
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            Catagory()));
                                              }),
                                          container(
                                              context: context,
                                              image: "images/salads.png",
                                              tittle: "Salads",
                                              onClick: () {
                                                Navigator.of(context).push(
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            Catagory()));
                                              }),
                                          container(
                                              context: context,
                                              image: "images/pasta.png",
                                              tittle: "Food",
                                              onClick: () {
                                                Navigator.of(context).push(
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            Catagory()));
                                              }),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      height: 60,
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 10),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Text(
                                            "Featured",
                                            style: TextStyle(
                                                color: Theme.of(context)
                                                    .primaryColor,
                                                fontSize: 30,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            "View All",
                                            style: TextStyle(
                                                color: Theme.of(context)
                                                    .primaryColor,
                                                fontSize: 19),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                        children: <Widget>[
                                          CircleContainer(
                                            image: foodpasta.image,
                                            text: foodpasta.foodName,
                                            subtext: foodpasta.foodsubTittle,
                                            price: foodpasta.price,
                                            ratting: foodpasta.ratting,
                                            onPress: () {
                                              Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          DetailScreen(
                                                            foodName: foodpasta
                                                                .foodName,
                                                            image:
                                                                foodpasta.image,
                                                            price:
                                                                foodpasta.price,
                                                            foodsubtittle:
                                                                foodpasta
                                                                    .foodsubTittle,
                                                          )));
                                            },
                                          ),
                                          CircleContainer(
                                            image: foodchicken.image,
                                            text: foodchicken.foodName,
                                            subtext: foodchicken.foodsubTittle,
                                            price: foodchicken.price,
                                            ratting: foodchicken.ratting,
                                            onPress: () {
                                              Navigator.of(context).push(
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      DetailScreen(
                                                    foodName:
                                                        foodchicken.foodName,
                                                    image: foodchicken.image,
                                                    price: foodchicken.price,
                                                    foodsubtittle: foodchicken
                                                        .foodsubTittle,
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                          CircleContainer(
                                            image: foodchicken.image,
                                            text: foodchicken.foodName,
                                            subtext: foodchicken.foodsubTittle,
                                            price: foodchicken.price,
                                            ratting: foodchicken.ratting,
                                            onPress: () {
                                              Navigator.of(context).push(
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      DetailScreen(
                                                    foodName:
                                                        foodchicken.foodName,
                                                    image: foodchicken.image,
                                                    price: foodchicken.price,
                                                    foodsubtittle: foodchicken
                                                        .foodsubTittle,
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      search(),
                    ],
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
