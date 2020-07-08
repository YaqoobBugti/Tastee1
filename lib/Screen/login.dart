import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../Widgets/mytextfield.dart';
import '../Widgets/Button.dart';


class Login extends StatefulWidget {
  static Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var  lodding=false;
  final _auth = FirebaseAuth.instance;
  String username;
  AuthResult authResult;
  RegExp regex = new RegExp(Login.pattern);
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  function() {
    if (email.text.trim().isEmpty || email.text.trim() == null) {
      _scaffoldKey.currentState.showSnackBar(
        SnackBar(
          content: Text('Email is empty'),
          backgroundColor: Theme.of(context).primaryColor,
        ),
      );
      return;
    } else if (!regex.hasMatch(email.text)) {
      _scaffoldKey.currentState.showSnackBar(
        SnackBar(
          content: Text('Please Enter Valid Email'),
          backgroundColor: Theme.of(context).primaryColor,
        ),
      );
      return;
    }
    if (password.text.isEmpty || password.text.trim() == null) {
      _scaffoldKey.currentState.showSnackBar(
        SnackBar(
          content: Text('Password is empty'),
          backgroundColor: Theme.of(context).primaryColor,
        ),
      );
      return;
    }
    if (password.text.length < 8) {
      _scaffoldKey.currentState.showSnackBar(
        SnackBar(
          content: Text('Password is too short'),
          backgroundColor: Theme.of(context).primaryColor,
        ),
      );
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: Container(
                  //color: Colors.amber,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Login",
                        style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color:Theme.of(context).primaryColor,),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Welcome back!",
                        style:
                            TextStyle(fontSize: 20, color: Theme.of(context).primaryColor,),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      MYTextField(
                        hintText: "Email",
                        controller: email,
                        obscuretext: false,
                      ),
                      MYTextField(
                        hintText: "Password",
                        controller: password,
                        obscuretext: true,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: Container(
                  child: Column(
                    children: <Widget>[
                      if(lodding)
                      CircularProgressIndicator(
                        backgroundColor: Colors.pink,
                      ),
                      if(!lodding)
                      Button(
                        buttoncolors: Theme.of(context).primaryColor,
                        textcolor: Colors.white,
                        tittle: "Login",
                        whenpress: () async {   
                          try {
                            setState(() {
                              lodding=true;
                            });
                            authResult = await _auth.signInWithEmailAndPassword(
                                email: email.text, password: password.text);
                          } on PlatformException catch (err) {
                            var massage =
                                "An error occurred ,please check your credentials";
                            if (err.message != null) {
                              massage = err.message;
                            }
                            _scaffoldKey.currentState.showSnackBar(
                              SnackBar(
                                content: Text(massage),
                                backgroundColor: Theme.of(context).primaryColor,
                              ),
                            );
                            setState(() {
                              lodding=false;
                            });
                          }
                          //function(); 
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text("don't have a account?"),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => SignUp()));
                            },
                            child: Text(
                              "Signup",
                              style: TextStyle(color: Theme.of(context).primaryColor,),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
