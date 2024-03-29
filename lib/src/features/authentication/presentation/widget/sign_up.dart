import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../common_widgets/tek_elevated_button.dart';
import '../../../../common_widgets/tek_text_field.dart';
import '../../../../constants/app_style.dart';
import '../../../../constants/colors.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        title: Text(
          'Sign Up',
          style: AppStyle.kHeading1,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 28, right: 28, bottom: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset(
                  'assets/images/signup.png',
                  height: 198,
                  alignment: Alignment.center,
                ),
              ),
              const SizedBox(height: 12),
              Text('Name', style: AppStyle.kRegular20),
              const SizedBox(height: 4),
              const TekTextField(),
              Text('Email', style: AppStyle.kRegular20),
              const SizedBox(height: 4),
              const TekTextField(),
              const SizedBox(height: 20),
              Text('Password', style: AppStyle.kRegular20),
              const SizedBox(height: 4),
              const TekTextField(),
              const SizedBox(height: 20),
              Text('Confirm Password', style: AppStyle.kRegular20),
              const SizedBox(height: 4),
              const TekTextField(),
              const SizedBox(height: 32),
              TekElevatedButton(
                title: 'Sign Up',
                onPressed: () {},
              ),
              const SizedBox(height: 20),
              Center(
                child: RichText(
                  text: TextSpan(
                    text: 'Have an account? ',
                    style: AppStyle.kRegular12,
                    children: [
                      TextSpan(
                        text: 'Sign in',
                        style: GoogleFonts.dmSerifDisplay(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: kBlue,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),


            ],
          ),
        ),
      ),
    );
  }
}
