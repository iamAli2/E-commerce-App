import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class themedata {
  static ThemeData lighttheme(BuildContext context) => ThemeData(
        fontFamily: GoogleFonts.poppins().fontFamily,
        backgroundColor: Colors.white,
        canvasColor: creamColor,
        hintColor: Vx.red800,
        focusColor: Vx.gray600,
        cardColor: Colors.white,
        accentColor: darkBluishColor,
        buttonColor: darkBluishColor,
        appBarTheme: AppBarTheme(
            color: Colors.white,
            elevation: 0.0,
            titleTextStyle: TextStyle(
              color: darkBluishColor,
              fontSize: 22,
              fontFamily: GoogleFonts.poppins().fontFamily,
            ),
            iconTheme: IconThemeData(color: Colors.black),
            // ignore: deprecated_member_use
            textTheme: Theme.of(context).textTheme),
      );
  static ThemeData darktheme(BuildContext context) => ThemeData(
        fontFamily: GoogleFonts.poppins().fontFamily,
        backgroundColor: Colors.black,
        canvasColor: darkcreameColor,
        hintColor: Vx.red800,
        focusColor: Colors.white70,
        cardColor: Colors.black,
        buttonColor: lightBluishcolor,
        accentColor: Colors.white,
        appBarTheme: AppBarTheme(
            color: Colors.black,
            titleTextStyle: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontFamily: GoogleFonts.poppins().fontFamily,
            ),
            elevation: 0.0,
            iconTheme: IconThemeData(color: Colors.white),
            // ignore: deprecated_member_use
            textTheme: Theme.of(context).textTheme),
      );

  //Color
  static Color creamColor = Color(0xfff5f5f5);
  static Color darkBluishColor = Color(0xff403b58);
  static Color darkcreameColor = Vx.gray900;
  static Color lightBluishcolor = Vx.indigo500;
}
