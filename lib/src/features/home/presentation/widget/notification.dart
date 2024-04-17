import 'package:flutter/material.dart';

import '../../../../constants/app_style.dart';
import '../../../../constants/colors.dart';

class Notification extends StatelessWidget {
  const Notification({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        title: Text(
          'Notification',
          style: AppStyle.kHeading1.copyWith(
            color: kGray16,
          ),
        ),
      ),
      body: Column(
        children: const [
          Divider(
            color: kGray85,
            thickness: 1,
          ),
          Text('Notification'),
        ],
      ),
    );
  }
}
