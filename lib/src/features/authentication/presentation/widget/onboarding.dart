import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:volun_tek/src/constants/colors.dart';
import 'package:volun_tek/src/routing/routes.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBlue,
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 60,
          vertical: 54.0 + MediaQuery.of(context).padding.top,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Explore & \nMake a \nDifference',
              style: GoogleFonts.dmSerifDisplay(
                fontSize: 48,
                fontWeight: FontWeight.w400,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 60),
            InkWell(
              onTap: () => Navigator.pushNamed(context, interest),
              child: const CircleAvatar(
                backgroundColor: kYellow,
                child: Icon(Icons.arrow_forward_ios_rounded, size: 20),
              ),
            )
          ],
        ),
      ),
    );
  }
}
