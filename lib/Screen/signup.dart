import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../Widgets/MYtextfield.dart';
import '../Widgets/Button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import '../Model/user.dart';
import 'package:path/path.dart' as Path;
import './login.dart';

class SignUp extends StatefulWidget {
  static Pattern patttern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
  static Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  @override
  _SignUpState createState() => _SignUpState();
}

Widget alreadyAccount(context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Text("already have an account?"),
      GestureDetector(
        onTap: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => Login()));
        },
        child: Text(
          "Login",
          style: TextStyle(
            color: Color(0xfffe257e),
          ),
        ),
      )
    ],
  );
}

class _SignUpState extends State<SignUp> {
  bool lodding = false;
  bool gender = true;
  File _image;

  Future getImage() async {
    final pickedFile = await ImagePicker().getImage(source: ImageSource.camera);

    setState(() {
      _image = File(pickedFile.path);
    });
  }

  Future<Map<String, String>> uploadFile(File _image) async {
    String _imagePath = _image.path;

    StorageReference storageReference = FirebaseStorage.instance
        .ref()
        .child('images/${Path.basename(_imagePath)}');
    StorageUploadTask uploadTask = storageReference.putFile(_image);
    StorageTaskSnapshot task = await uploadTask.onComplete;
    final String _imageUrl = (await task.ref.getDownloadURL());

    Map<String, String> _downloadData = {
      'imagePath': Path.basename(_imagePath),
      'imageUrl': _imageUrl
    };
    return _downloadData;
  }

  final _auth = FirebaseAuth.instance;
  AuthResult authResult;

  RegExp regex = RegExp(SignUp.pattern);
  RegExp regExp = RegExp(SignUp.patttern);
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController fullname = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController all = TextEditingController();
  final TextEditingController adress = TextEditingController();
  void function() {
    if (_image == null) {
      _scaffoldKey.currentState.showSnackBar(
        SnackBar(
          content: Text('Profile image is null'),
          backgroundColor: Theme.of(context).primaryColor,
        ),
      );
      return;
    }
    if (fullname.text.isEmpty &&
        email.text.isEmpty &&
        phone.text.isEmpty &&
        password.text.isEmpty) {
      _scaffoldKey.currentState.showSnackBar(
        SnackBar(
          content: Text('All field is emtpy'),
          backgroundColor: Theme.of(context).primaryColor,
        ),
      );
      return;
    } else if (fullname.text.trim().isEmpty || fullname.text.trim() == null) {
      _scaffoldKey.currentState.showSnackBar(
        SnackBar(
          content: Text('Full Name is empty'),
          backgroundColor: Theme.of(context).primaryColor,
        ),
      );
      return;
    } else if (email.text.trim().isEmpty || email.text.trim() == null) {
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
    if (phone.text.trim().isEmpty || phone.text.trim() == null) {
      _scaffoldKey.currentState.showSnackBar(
        SnackBar(
          content: Text('phone is empty'),
          backgroundColor: Theme.of(context).primaryColor,
        ),
      );
      return;
    } else if (phone.text.length > 11) {
      _scaffoldKey.currentState.showSnackBar(
        SnackBar(
          content: Text('Phone Number Must be eleven'),
          backgroundColor: Theme.of(context).primaryColor,
        ),
      );
      return;
    } else if (!regExp.hasMatch(phone.text)) {
      _scaffoldKey.currentState.showSnackBar(
        SnackBar(
          content: Text('Please enter valid mobile number'),
          backgroundColor: Theme.of(context).primaryColor,
        ),
      );
      return;
    }

    if (password.text.trim().isEmpty || password.text.trim() == null) {
      _scaffoldKey.currentState.showSnackBar(
        SnackBar(
          content: Text('Password is empty'),
          backgroundColor: Theme.of(context).primaryColor,
        ),
      );
      return;
    } else if (password.text.length < 8) {
      _scaffoldKey.currentState.showSnackBar(
        SnackBar(
          content: Text('Password is too short'),
          backgroundColor: Theme.of(context).primaryColor,
        ),
      );
    }
    if (adress.text.trim().isEmpty || adress.text.trim() == null) {
      _scaffoldKey.currentState.showSnackBar(
        SnackBar(
          content: Text('Address is empty'),
          backgroundColor: Theme.of(context).primaryColor,
        ),
      );
    } else {
      tryCatch();
    }
  }

  void tryCatch() async {
    try {
      setState(() {
        lodding = true;
      });

      authResult = await _auth.createUserWithEmailAndPassword(
          email: email.text, password: password.text);

      var image = await uploadFile(_image);

      User user = User(
        contect: this.phone.text,
        email: this.email.text,
        fullname: this.fullname.text,
        password: this.password.text,
        address: this.adress.text,
        gender: this.gender ? 'male' : "Female",
        image: image["imageUrl"],
        userimage: image["imagePath"],
      );

      Firestore.instance
          .collection("user")
          .document(authResult.user.uid)
          .setData({
        "username": user.fullname,
        "password": user.password,
        "contect": user.contect,
        'email': user.email,
        "userId": authResult.user.uid,
        "address": user.address,
        "gender": user.gender,
        "imageUrl": user.image,
        'imagepath': user.userimage,
      });
    } on PlatformException catch (err) {
      var massage = "An error occurred ,please check your credentials";
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
        lodding = false;
      });
    }
    setState(() {
      lodding = false;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: Container(
                    width: double.infinity,
                    //color: Colors.red,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "Signup",
                                  style: TextStyle(
                                      fontSize: 40,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xfffe257e)),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "create an account",
                                  style: TextStyle(
                                      fontSize: 20, color: Color(0xfffe257e)),
                                )
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            getImage();
                          },
                          child: Container(
                            child: CircleAvatar(
                              maxRadius: 64,
                              backgroundColor: Colors.red,
                              child: CircleAvatar(
                                maxRadius: 60,
                                backgroundImage: _image == null
                                    ? AssetImage("images/cat.png")
                                    : FileImage(_image),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  //color: Colors.green,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      MYTextField(
                        hintText: "Full Name",
                        controller: fullname,
                        obscuretext: false,
                        keyboard: TextInputType.text,
                      ),
                      MYTextField(
                        hintText: "Email",
                        controller: email,
                        obscuretext: false,
                        keyboard: TextInputType.emailAddress,
                      ),
                      MYTextField(
                        hintText: "Phone Number",
                        controller: phone,
                        obscuretext: false,
                        keyboard: TextInputType.phone,
                      ),
                      MYTextField(
                        hintText: "Password",
                        controller: password,
                        obscuretext: true,
                        keyboard: TextInputType.visiblePassword,
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            gender = !gender;
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.only(top: 24, left: 17),
                          width: double.infinity,
                          height: 66,
                          decoration: BoxDecoration(
                            color: Color(0xfffef6fa),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Text(
                            gender ? "Male" : "Female",
                            style: TextStyle(fontSize: 22),
                          ),
                        ),
                      ),
                      MYTextField(
                        hintText: "Address",
                        controller: adress,
                        obscuretext: false,
                        keyboard: TextInputType.text,
                      ),
                      if (lodding)
                        CircularProgressIndicator(
                          backgroundColor: Colors.pink,
                        ),
                      if (!lodding)
                        Button(
                          buttoncolors: Theme.of(context).primaryColor,
                          textcolor: Colors.white,
                          tittle: "Signup",
                          whenpress: (){
                            function();
                          },
                        ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
