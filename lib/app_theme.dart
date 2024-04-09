import 'package:flutter/material.dart';

class AppTheme{
  static Color primaryColor = const Color(0xff39A552);
  static Color whiteColor = const Color(0xffffffff);
  static Color redColor = const Color(0xffC91C22);
  static Color darkBlueColor = const Color(0xff003E90);
  static Color pinkColor = const Color(0xffED1E79);
  static Color brownColor = const Color(0xffCF7E48);
  static Color blueColor = const Color(0xff4882CF);
  static Color yellowColor = const Color(0xffF2D352);
  static Color grayColor = const Color(0xff4F5A69);
  static Color blackColor = const Color(0xff303030);

  static ThemeData lightTheme = ThemeData(
    primaryColor: primaryColor,
    appBarTheme: AppBarTheme(
      backgroundColor: primaryColor,
      centerTitle: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(30) ,
          bottomLeft: Radius.circular(30)
        )
      )
    ),
    textTheme: TextTheme(
      titleLarge: TextStyle(
        fontSize: 22, fontWeight: FontWeight.bold, color: whiteColor
      ),
      titleMedium: TextStyle(
          fontSize: 20, fontWeight: FontWeight.bold, color: blackColor
      ),
      titleSmall:TextStyle(
          fontSize: 18, fontWeight: FontWeight.bold, color: blackColor
      )
    )
  );
}