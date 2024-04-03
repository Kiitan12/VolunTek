import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/colors.dart';

class TekTextField extends StatelessWidget {
  const TekTextField({
    super.key,
    this.validator,
    this.keyboardType,
    this.controller,
  });

  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
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
