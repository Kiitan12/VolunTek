import 'package:flutter/material.dart';
import 'package:volun_tek/src/constants/app_style.dart';

import '../constants/colors.dart';

class TekElevatedButton extends StatelessWidget {
  const TekElevatedButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.buttonColor,
  });

  final String title;
  final VoidCallback onPressed;
  final Color? buttonColor;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.5,
        height: 52,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: buttonColor ?? kBlue,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40),
            ),
          ),
          child: Text(title, style: AppStyle.kRegular16),
        ),
      ),
    );
  }
}
