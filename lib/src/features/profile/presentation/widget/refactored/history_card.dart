import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../../../../../constants/app_style.dart';
import '../../../../../constants/colors.dart';

class HistoryCard extends StatelessWidget {
  const HistoryCard({
    super.key,
    required this.title,
    required this.time,
    required this.address,
    required this.duration,
  });

  final String title;
  final Timestamp time;
  final String address;
  final String duration;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.6,
                child: Text(
                  title,
                  style: AppStyle.kRegular16Inter,
                ),
              ),
              Text(
                //
                timeago.format(time.toDate(), allowFromNow: true),
                style: AppStyle.kRegular10,
              )
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              const Icon(Icons.location_on, color: kBlueAccent),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.33,
                child: Text(
                  address,
                  overflow: TextOverflow.ellipsis,
                  style: AppStyle.kRegular10,
                ),
              ),
              const SizedBox(width: 8),
              const Icon(Icons.access_time_filled, color: kBlueAccent),
              const SizedBox(width: 4),
              Text(duration, style: AppStyle.kRegular10),
            ],
          )
        ],
      ),
    );
  }
}
