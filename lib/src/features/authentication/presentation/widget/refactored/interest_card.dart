import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../constants/colors.dart';

class InterestCard extends StatelessWidget {
  const InterestCard({
    super.key,
    this.isSelected = false,
    required this.title,
    required this.image,
  });

  final bool isSelected;
  final String title;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 160,
          height: 160,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            border: Border.all(color: isSelected? kYellow : kSeaShell, width: 6),
            image: DecorationImage(
              image: AssetImage(image),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          title,
          style: GoogleFonts.dmSerifDisplay(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: kDarkBlue,
          ),
        )
      ],
    );
  }
}
