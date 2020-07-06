import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Get extends StatefulWidget {
  @override
  _GetState createState() => _GetState();
}

class _GetState extends State<Get> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: Firestore.instance.collection('food').snapshots(),
        builder: (ctx, streamSnapshot) {
          if (streamSnapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          final document = streamSnapshot.data.documents;
          return ListView.builder(
            itemCount: document.length,
            itemBuilder: (ctx, index) => Container(
              padding: EdgeInsets.all(8),
              child: Text(document[index]['name']),
            ),
          );
        },
      ),
    );
  }
}
