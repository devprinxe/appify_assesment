import 'package:flutter/material.dart';
 


String FONT_NAME = 'Aeroport';
String ROBOT_FONT_NAME = 'Roboto';

var cLargeLabelTextStyle =
TextStyle(fontWeight: FontWeight.bold, fontSize: 40.0, color: Colors.white);

var cLabelTextStyle = TextStyle(
  fontSize: 18.0,
  color: Color(0xFFFFFFFF),
);

var cAppBarTextStyle = TextStyle(
  fontSize: 18.0,
  fontWeight: FontWeight.bold,
  color: Color(0xFFFFFFFF),
);

var kTempTextStyle = TextStyle(
  fontFamily: 'Aeroport',
  fontSize: 100.0,
);

var kMessageTextStyle = TextStyle(
  fontFamily: 'Aeroport',
  fontSize: 60.0,
);

var kButtonTextStyle = TextStyle(
  fontSize: 30.0,
  fontFamily: 'Aeroport',
);

var kConditionTextStyle = TextStyle(
  fontSize: 100.0,
);

var introTitleTextStyle = TextStyle(
    fontFamily: FONT_NAME,
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: Colors.black,
);

var introSubTitleTextStyle = TextStyle(
  fontFamily: FONT_NAME,
  fontSize: 13,
  fontWeight: FontWeight.normal,
  color: Colors.grey,
);

var barTitleTextStyle = TextStyle(
    fontFamily: FONT_NAME,
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: Colors.black,
);


var barTitleTextStyle2 = TextStyle(
  fontFamily: FONT_NAME,
  fontSize: 22,
  fontWeight: FontWeight.bold,
  color: Colors.black,
);

var homeTextStyle = TextStyle(
    fontFamily: FONT_NAME,
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: Colors.black,
);

var homeTextStyle2 = TextStyle(
  fontFamily: FONT_NAME,
  fontSize: 22,
  fontWeight: FontWeight.normal,
  color: Colors.white,
);
var homeTextStyle20 = TextStyle(
  fontFamily: FONT_NAME,
  fontSize: 20,
  fontWeight: FontWeight.normal,
  color: Colors.white,
);
var homeTextStyle16 = TextStyle(
  fontFamily: FONT_NAME,
  fontSize: 16,
  fontWeight: FontWeight.normal,
  color: Colors.black,
);

var leaderboardStyle = TextStyle(
  fontFamily: FONT_NAME,
  fontSize: 16,
  fontWeight: FontWeight.normal,
  color: Colors.white,
);

var practiceTextStyle = TextStyle(
    fontFamily: FONT_NAME,
    fontSize: 20,
    fontWeight: FontWeight.normal,
    color: Colors.black,
);

var practiceTextStyle2 = TextStyle(
  fontFamily: FONT_NAME,
  fontSize: 16,
  fontWeight: FontWeight.normal,
  color: Colors.deepOrangeAccent,
);

var practiceTextStyle3 = TextStyle(
  fontFamily: FONT_NAME,
  fontSize: 18,
  fontWeight: FontWeight.normal,
  color: Colors.black,
);
var homeTextSubStyle = TextStyle(
  fontFamily: FONT_NAME,
  fontSize: 12,
  fontWeight: FontWeight.normal,
  color: Colors.black,
);

var editTextStyle = TextStyle(
  fontFamily: FONT_NAME,
  fontSize: 15,
  fontWeight: FontWeight.normal,
  color: Colors.black,
);

var commonTextStyle = TextStyle(
  fontFamily: FONT_NAME,
  fontSize: 15,
  fontWeight: FontWeight.normal,
  color: Colors.black,
);

var commonTextStyleB = TextStyle(
  fontFamily: FONT_NAME,
  fontSize: 17,
  fontWeight: FontWeight.bold,
  color: Colors.black,
);

var menuTextStyle = TextStyle(
  fontFamily: FONT_NAME,
  fontSize: 10,
  fontWeight: FontWeight.normal,
  color:Color(0xFF727272),
);

var commonTextStyleWhite = TextStyle(
  fontFamily: FONT_NAME,
  fontSize: 15,
  fontWeight: FontWeight.normal,
  color: Colors.white,
);

var commonTextStyleWhite2 = TextStyle(
  fontFamily: FONT_NAME,
  fontSize: 12,
  fontWeight: FontWeight.normal,
  color: Colors.white,
);

var commonTextStyleGrey = TextStyle(
  fontFamily: FONT_NAME,
  fontSize: 15,
  fontWeight: FontWeight.normal,
  color: Color(0xFF727272),
);

var buttonTextStyle = TextStyle(
  fontFamily: FONT_NAME,
  fontSize: 18,
  fontWeight: FontWeight.normal,
  color: Colors.white,
);

var buttonDecoration = BoxDecoration(
  borderRadius:  BorderRadius.circular(8),
  color: Color(0xFFF2AB12),
   );


TextStyle getTextStyleDisplay(double sized,FontWeight weight,Color color){
  return TextStyle(
    fontFamily: FONT_NAME,
    fontSize: sized,
    fontWeight: weight == null?FontWeight.normal:weight,
    color: color == null?Colors.black:color,
  );
}
TextStyle getTextStyleAsap(double sized,FontWeight weight,Color color){
  return TextStyle(
    fontFamily: FONT_NAME,
    fontSize: sized,
    fontWeight: weight == null?FontWeight.normal:weight,
    color: color == null?Colors.black:color,
  );
}
TextStyle getTextStyleRoboto(double sized,FontWeight weight,Color color){
  return TextStyle(
    fontFamily: ROBOT_FONT_NAME,
    fontSize: sized,
    fontWeight: weight == null?FontWeight.normal:weight,
    color: color == null?Colors.black:color,
  );
}

TextStyle getTextStyle(double sized,FontWeight? weight,Color? color, {bool lineThrough = false}){
  return TextStyle(
    fontFamily: FONT_NAME,
    fontSize: sized,
    fontWeight: weight ?? FontWeight.normal,
    color: color ?? Colors.black,
    height: 1.1,
    decoration: lineThrough?TextDecoration.lineThrough:null
  );
}
