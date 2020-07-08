import 'package:flutter/material.dart';
import './data_page.dart';
import '../Widgets/circlecontainer.dart';

class Detail extends StatefulWidget {
  final ListWords listWordsDetail;

  Detail({Key key, @required this.listWordsDetail}) : super(key: key);

  @override
  _DetailState createState() => _DetailState();
}
  // Widget bulidrowContainer(
  //       {String image,
  //       String text,
  //       Color color,
  //       Color circlecolor,
  //       Color textcolor}) {
  //     return Container(
  //       decoration: BoxDecoration(
  //         borderRadius: BorderRadius.circular(10),
  //         color: color,
  //       ),
  //       height: 200,
  //       width: 150,
  //       child: Column(
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         children: <Widget>[
  //           CircleAvatar(
  //             backgroundColor: circlecolor,
  //             maxRadius: 57,
  //             backgroundImage: AssetImage(image),
  //           ),
  //           SizedBox(
  //             height: 20,
  //           ),
  //           Text(
  //             text,
  //             style: TextStyle(
  //                 fontSize: 22, fontWeight: FontWeight.w400, color: textcolor),
  //           ),
  //         ],
  //       ),
  //     );
  //   }

class _DetailState extends State<Detail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.dark,
        title: const Text('Detail', style: TextStyle(color: Colors.white)),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: GridView.count(
        crossAxisCount: 1,
        childAspectRatio: 0.1,
        crossAxisSpacing: 90,
        mainAxisSpacing: 40,
        children: <Widget>[
         CircleContainer(
            image: "https://asset.slimmingworld.co.uk/content/media/9787/chicken-and-med-veg-pasta_sw_recipe.jpg?v1=JGXiore20qg9NNIj0tmc3TKfKw-jr0s127JqqpCA2x7sMviNgcAYh1epuS_Lqxebn9V_qusKHfwbF7MOUrAPptzBhXIUL1Xnq2Mmdvx4fOk&width=640&height=640",
            text: "pasta Cheese",
            subtext: "7 Ocen Hotel ",
            price: 2.2,
            ratting:44.2,
            onPress: () {
            },
          ),
        ],
      ),
    );
  }
}
