import 'package:flutter/material.dart';

import '../../../../constants/app_style.dart';
import '../../../../constants/colors.dart';
import '../../../profile/presentation/widget/refactored/history_card.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        title: Text(
          'Notification',
          style: AppStyle.kHeading1.copyWith(
            color: kGray16,
          ),
        ),
      ),
      body: const Column(
        children: [
          Divider(color: kBlueAccent),
          HistoryCard(),
          Divider(color: kBlueAccent),
          HistoryCard(),
          Divider(color: kBlueAccent),
        ],
      ),
    );
  }
}
