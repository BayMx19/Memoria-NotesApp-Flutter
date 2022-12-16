import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppStyle {
  static Color bgColor = Color(0xFFfdfdfd);
  static Color mainColor = Color(0xFFB9F443);
    static Color accentColor = Color(0xFF0065FF);

  static List<Color> cardsColor = [

    Colors.red.shade200,
    Colors.pink.shade200,
    Colors.orange.shade200,
    Colors.yellow.shade200,
    Colors.green.shade200,
    Colors.blue.shade200,
    Colors.blueGrey.shade200,
    ];

    static TextStyle mainTitle = GoogleFonts.inter(
      fontSize: 24.0, fontWeight: FontWeight.bold
    );

     static TextStyle mainContent = GoogleFonts.roboto(
      fontSize: 20.0, fontWeight: FontWeight.bold,
    );

     static TextStyle dateTitle = GoogleFonts.lato(
      fontSize: 14.0, fontWeight: FontWeight.w500
    );
}