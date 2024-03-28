import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:volun_tek/src/constants/colors.dart';

import 'refactored/interest_card.dart';

class Interest extends StatelessWidget {
  Interest({super.key});

  final images = [
    'assets/images/img1.png',
    'assets/images/img2.png',
    'assets/images/img3.png',
    'assets/images/img4.png',
    'assets/images/img5.png',
    'assets/images/img6.png',
    'assets/images/img7.png',
    'assets/images/img8.png',
  ];

  final titles = [
    'Interest 0',
    'Interest 1',
    'Interest 2',
    'Interest 3',
    'Interest 4',
    'Interest 5',
    'Interest 6',
    'Interest 7',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 32.0,
          vertical: 32.0 + MediaQuery.of(context).padding.top,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Interests',
                style: GoogleFonts.dmSerifDisplay(
                    fontSize: 32,
                    fontWeight: FontWeight.w400,
                    color: kDarkBlue),
              ),
              const SizedBox(height: 24),
              Text(
                'Tell us what causes interest you. '
                'This will help us match you with the right opportunity',
                style: GoogleFonts.dmSerifDisplay(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: kDarkBlue,
                ),
              ),
              const SizedBox(height: 0),
              GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 24,
                ),
                itemCount: titles.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return InterestCard(
                    title: titles.elementAt(index),
                    image: images.elementAt(index),
                  );
                },
              ),
              ElevatedButton(
                onPressed: ()=> Navigator.pushNamed(context, '/onboarding'),
                child: Text('Submit'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
