import 'package:flutter/material.dart';

import '../../../../../constants/app_style.dart';
import '../../../../../constants/colors.dart';

class Interest extends StatelessWidget {
  const Interest({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: kDarkBlue,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Text(title, style: AppStyle.kRegular14),
    );
  }
}
