import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:volun_tek/src/common_widgets/tek_elevated_button.dart';
import 'package:volun_tek/src/constants/app_style.dart';

import '../../../../constants/colors.dart';
import '../provider/task_provider.dart';

class OpportunityView extends StatefulWidget {
  const OpportunityView({
    super.key,
  });

  @override
  State<OpportunityView> createState() => _OpportunityViewState();
}

class _OpportunityViewState extends State<OpportunityView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer(builder: (context, ref, child) {
        final task = ref.watch(taskProvider);
        return SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
                child: Stack(
                  children: [
                    CachedNetworkImage(
                      imageUrl: task.imgUrl,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      height: 200,
                    ),
                    Positioned(
                      top: 0,
                      left: 16,
                      child: IconButton(
                        icon: const Icon(Icons.arrow_back),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 48),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      task.title,
                      style: AppStyle.kRegular20.copyWith(fontSize: 25),
                    ),
                    Text(task.interest),
                    const SizedBox(height: 28),
                    TekElevatedButton(title: 'Show Interest', onPressed: () {}),
                    const SizedBox(height: 24),
                    const Row(
                      children: [
                        Icon(Icons.favorite_border),
                        SizedBox(width: 8),
                        Text('Save for later')
                      ],
                    ),
                    const SizedBox(height: 20),
                    Text(
                      task.description,
                      style: GoogleFonts.inter(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 36),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.location_on, color: kBlueAccent),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.45,
                              child: Text(
                                task.location,
                                overflow: TextOverflow.ellipsis,
                                style: AppStyle.kRegular10,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            const Icon(Icons.access_time_filled,
                                color: kBlueAccent),
                            const SizedBox(width: 4),
                            Text('2Hrs', style: AppStyle.kRegular10),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 48),
              const Divider(color: kBlueAccent),
              const SizedBox(height: 36),
              Text(
                'Rate this opportunity',
                style: AppStyle.kRegular10.copyWith(fontSize: 12),
              ),
              const SizedBox(height: 18),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (var i = 0; i < 5; i++)
                    const Icon(Icons.star_border_outlined)
                ],
              ),
              const SizedBox(height: 32),
            ],
          ),
        );
      }),
    );
  }
}
