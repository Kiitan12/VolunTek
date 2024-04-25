import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badge;
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:volun_tek/src/features/profile/presentation/widget/refactored/history_card.dart';

import '../../../../constants/app_style.dart';
import '../../../../constants/colors.dart';
import '../provider/user_provider.dart';
import 'refactored/profile_tile.dart';
import 'refactored/volunteer_type.dart';

class History extends StatelessWidget {
  const History({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        centerTitle: true,
        title: Text(
          'History',
          style: AppStyle.kHeading1.copyWith(
            color: kGray16,
          ),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 16),
          Center(
            child: badge.Badge(
              badgeStyle: const badge.BadgeStyle(
                badgeColor: kYellow,
                elevation: 0,
              ),
              badgeContent: const Icon(Icons.edit, color: kBlueAccent),
              child: CircleAvatar(
                radius: 43,
                backgroundColor: kBlue,
                child: Image.asset(
                  'assets/images/profile.png',
                  height: 76,
                  width: 76,
                ),
              ),
            ),
          ),
          const SizedBox(height: 12),
          const ProfileTile(
            imgUrl: 'assets/svg/check_circle.svg',
            title: '100 hrs completed',
          ),
          const SizedBox(height: 12),
          const VolunteerType(),
          const SizedBox(height: 32),
          const Divider(color: kBlueAccent),
          Consumer(builder: (context, ref, child) {
            final history = ref.watch(getHistoryProvider);
            return history.when(
              data: (data) {
                if(data.isEmpty) {
                  return  Center(
                    child: Text(
                      'No History ',
                      style: AppStyle.kRegular20,
                    ),
                  );
                }
                return Expanded(
                  child: ListView.separated(
                    itemCount: data.length,
                    separatorBuilder: (context, index) => const Divider(
                      color: kBlueAccent,
                    ),
                    itemBuilder: (context, index) {
                      return HistoryCard(
                        title: data[index].title,
                         address: data[index].location,
                        duration: data[index].time,
                       time: Timestamp.now(),
                      );
                    },
                  ),
                );
              },
              error: (error, stackTrace) {
                return Center(
                  child: Text(
                    'Error: $error',
                    style: AppStyle.kHeading1.copyWith(
                    ),
                  ),
                );
              },
              loading: () => const Center(
                child: CircularProgressIndicator(
                  color: kBlueAccent,
                ),
              )
            );
          }),
          const Divider(color: kBlueAccent),
        ],
      ),
    );
  }
}
