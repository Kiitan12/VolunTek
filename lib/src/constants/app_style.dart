import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';

class AppStyle {
  static TextStyle kHeading1 = GoogleFonts.dmSerifDisplay(
    fontSize: 32,
    fontWeight: FontWeight.w400,
    color: kDarkBlue,
  );

  static TextStyle kRegular20 = GoogleFonts.dmSerifDisplay(
    fontSize: 20,
    fontWeight: FontWeight.w400,
    color: kDarkBlue,
  );

  static TextStyle kRegular16 = GoogleFonts.dmSerifDisplay(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: Colors.white,
  );

  static TextStyle kRegular16Inter = GoogleFonts.inter(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: kDarkBlue,
  );

  static TextStyle kRegular14 = GoogleFonts.dmSerifDisplay(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: Colors.white,
  );

  static TextStyle kRegular12 = GoogleFonts.dmSerifDisplay(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: kDarkBlue,
  );

  static TextStyle kRegular12Inter = GoogleFonts.inter(
    fontSize: 12,
    fontWeight: FontWeight.w300,
    color: kGray16,
  );


  static TextStyle kRegular10 = GoogleFonts.inter(
    fontSize: 10,
    fontWeight: FontWeight.w300,
    color: kDarkBlue,
  );

  static OutlineInputBorder kNoBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(20),
    borderSide: BorderSide.none,
  );
}
