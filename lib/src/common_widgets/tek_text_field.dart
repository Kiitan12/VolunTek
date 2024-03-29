import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/colors.dart';

class TekTextField extends StatelessWidget {
  const TekTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintStyle: GoogleFonts.dmSerifDisplay(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: kGray,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40),
          borderSide: const BorderSide(color: kBlue),
        ),
      ),
    );
  }
}