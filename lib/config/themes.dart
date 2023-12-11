import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Color black = const Color.fromRGBO(43, 45, 51, 1);
Color grey = const Color.fromRGBO(135, 153, 165, 1);
Color lightGrey = const Color.fromRGBO(228, 230, 236, 1);
Color blue = const Color.fromRGBO(7, 0, 255, 1);
Color darkBlue = const Color.fromRGBO(22, 19, 130, 1);
Color red = const Color.fromRGBO(255, 88, 93, 1);

TextTheme defaultTextTheme = TextTheme(
  displayLarge: GoogleFonts.ubuntu(fontSize: 64, height: 1.125, fontWeight: FontWeight.w500, color: Colors.white),
  headlineLarge: GoogleFonts.ubuntu(fontSize: 28, height: 1.143, fontWeight: FontWeight.w500, color: black),
  // headlineMedium: TextStyle(),
  // headlineSmall: TextStyle(),
  bodyLarge: GoogleFonts.roboto(fontSize: 17, height: 1.42, fontWeight: FontWeight.w400, color: grey),
  bodyMedium: GoogleFonts.roboto(
    fontSize: 15,
    height: 1.45,
    fontWeight: FontWeight.w400,
    color: grey,
  ),
  // bodySmall: TextStyle(),
);
