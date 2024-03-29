import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:volun_tek/src/constants/app_style.dart';
import 'package:volun_tek/src/constants/colors.dart';
import 'package:volun_tek/src/routing/routes.dart';

import '../../../../common_widgets/tek_elevated_button.dart';
import '../../../../common_widgets/tek_text_field.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 28, right: 28, top: 8),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Text('Login', style: AppStyle.kHeading1),
                ),
                Center(
                  child: Image.asset(
                    'assets/images/login.png',
                    height: 295,
                    alignment: Alignment.center,
                  ),
                ),
                const SizedBox(height: 12),
                Text('Email', style: AppStyle.kRegular20),
                const SizedBox(height: 4),
                const TekTextField(),
                const SizedBox(height: 20),
                Text('Password', style: AppStyle.kRegular20),
                const SizedBox(height: 4),
                const TekTextField(),
                const SizedBox(height: 12),
                Align(
                  alignment: Alignment.centerRight,
                  child: InkWell(
                    onTap: () => Navigator.pushNamed(context, confirmMail),
                    child: Text(
                      'Forgot your password?',
                      style: AppStyle.kRegular12,
                    ),
                  ),
                ),
                const SizedBox(height: 32),
                TekElevatedButton(
                  title: 'Sign In',
                  onPressed: (){},
                ),
                const SizedBox(height: 20),
                Center(
                  child: InkWell(
                    onTap: () => Navigator.pushNamed(context, signup),
                    child: RichText(
                      text: TextSpan(
                        text: 'Don\'t have an account? ',
                        style: AppStyle.kRegular12,
                        children: [
                          TextSpan(
                            text: 'Sign up',
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
