import 'package:flutter/material.dart';
import './data_page.dart';

class Detail extends StatefulWidget {
  final ListWords listWordsDetail;

  Detail({Key key, @required this.listWordsDetail}) : super(key: key);

  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  @override
  Widget build(BuildContext context) {
    
    Widget _bulidrowContainer(
        {String image,
        String text,
        Color color,
        Color circlecolor,
        Color textcolor}) {
      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: color,
        ),
        height: 200,
        width: 150,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              backgroundColor: circlecolor,
              maxRadius: 40,
              backgroundImage: AssetImage(image),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              text,
              style: TextStyle(
                  fontSize: 22, fontWeight: FontWeight.w400, color: textcolor),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.dark,
        title: const Text('Détail', style: TextStyle(color: Colors.white)),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: GridView.count(
        crossAxisCount: 3,
        childAspectRatio: 0.70,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,

        children: <Widget>[
          Container(       
            color: Colors.red,
          ),
          _bulidrowContainer(
            text: 'fish',
            image: 'images/image6.png',
            circlecolor: Color(0xffc01645),
            color: Color(0xffd7184c),
            textcolor: Colors.white,
          ),
              _bulidrowContainer(
            text: 'fish',
            image: 'images/image6.png',
            circlecolor: Color(0xffc01645),
            color: Color(0xffd7184c),
            textcolor: Colors.white,
          ),
            _bulidrowContainer(
            text: 'fish',
            image: 'images/image6.png',
            circlecolor: Color(0xffc01645),
            color: Color(0xffd7184c),
            textcolor: Colors.white,
          ),
              _bulidrowContainer(
            text: 'fish',
            image: 'images/image6.png',
            circlecolor: Color(0xffc01645),
            color: Color(0xffd7184c),
            textcolor: Colors.white,
          ),
            _bulidrowContainer(
            text: 'fish',
            image: 'images/image6.png',
            circlecolor: Color(0xffc01645),
            color: Color(0xffd7184c),
            textcolor: Colors.white,
          ),
              _bulidrowContainer(
            text: 'fish',
            image: 'images/image6.png',
            circlecolor: Color(0xffc01645),
            color: Color(0xffd7184c),
            textcolor: Colors.white,
          ),
        ],
      ),
      // Text(listWordsDetail.titlelist + ' (Assar.Bugti)'),
      // Text(listWordsDetail.definitionlist),
    );
  }
}
