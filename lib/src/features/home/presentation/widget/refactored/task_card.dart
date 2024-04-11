import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../../constants/app_style.dart';
import '../../../../../constants/colors.dart';
import '../../../domain/model/task.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({
    super.key,
    required this.task,
    this.onTap,
  });

  final Task task;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 236,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        decoration: BoxDecoration(
          color: kGray85,
          borderRadius: BorderRadius.circular(40),
        ),
        child: Column(
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: CachedNetworkImage(
                    imageUrl: task.imgUrl,
                    width: 54,
                    height: 54,
                    fit: BoxFit.cover,
                    placeholder: (context, url) =>
                        const CircularProgressIndicator(),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      task.interest,
                      style: AppStyle.kRegular14.copyWith(color: kGray65),
                    ),
                    Text(task.title, style: AppStyle.kRegular20),
                  ],
                )
              ],
            ),
            const SizedBox(height: 12),
            SizedBox(
              height: 64,
              child: Text(
                task.description,
                maxLines: 5,
                overflow: TextOverflow.ellipsis,
                style: AppStyle.kRegular12,
              ),
            ),
            const SizedBox(height: 28),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(Icons.location_on, color: kBlueAccent),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.23,
                      child: Text(
                        task.location,
                        overflow: TextOverflow.ellipsis,
                        style: AppStyle.kRegular10,
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Icon(Icons.access_time_filled, color: kBlueAccent),
                    const SizedBox(width: 4),
                    Text('2Hrs', style: AppStyle.kRegular10),
                  ],
                ),
                const Row(
                  children: [
                    Icon(Icons.share, color: kBlueAccent),
                    SizedBox(width: 4),
                    InkWell(
                      child: Icon(Icons.favorite_border, color: kBlueAccent),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
