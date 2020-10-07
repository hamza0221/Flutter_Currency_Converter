import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class SplashScreen extends StatelessWidget {
  var screenWidth, screenHeight;

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width * 0.04 / 14.5;
    screenHeight = MediaQuery.of(context).size.height * 0.02 / 14;
    return Material(child:
      Container(
         color: Hexcolor("#57a67e"),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          /* Text(
            "Found me",
            style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Hexcolor("#EC1C40"),
                fontFamily: Config.SFProText),
          ),*/
          Image.asset(
            "assets/images/cash.jpg",
            height: screenWidth * 300,
            width: screenWidth * 300,
          ),
          SizedBox(height: 20 * screenWidth),
          CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(Hexcolor("#fed797"))),
        ],
      ),
    ),);
  }
}
