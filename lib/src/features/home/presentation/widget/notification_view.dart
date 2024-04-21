import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:volun_tek/src/features/home/presentation/widget/refactored/notification_card.dart';

import '../../../../constants/app_style.dart';
import '../../../../constants/colors.dart';
import '../provider/notification_provider.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        centerTitle: true,
        title: Text(
          'Notification',
          style: AppStyle.kHeading1.copyWith(
            color: kGray16,
          ),
        ),
      ),
      body: Consumer(builder: (context, ref, child) {
        final notify = ref.watch(getNotification);

        return notify.when(
          data: (notifications) {
            if (notifications.isEmpty) {
              return const Center(
                child: Text('No notifications available.'),
              );
            }
            return ListView.builder(
              itemCount: notifications.length,
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                final notification = notifications[index];
                return NotificationCard(
                  title: notification.title,
                  description: notification.body,
                  date: notification.date,
                );
              },
            );
          },
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
          error: (error, stackTrace) {
            return Center(
              child: Text('Error: $error'),
            );
          },
        );
      }),
    );
  }
}
