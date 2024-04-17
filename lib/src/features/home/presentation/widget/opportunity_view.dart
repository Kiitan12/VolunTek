import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:volun_tek/globals.dart';
import 'package:volun_tek/src/common_widgets/tek_elevated_button.dart';
import 'package:volun_tek/src/constants/app_style.dart';

import '../../../../constants/colors.dart';
import '../../../../routing/routes.dart';
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
                padding:
                    EdgeInsets.only(top: MediaQuery.of(context).padding.top),
                child: Stack(
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        color: kBlueAccent,
                        border: Border(
                          bottom: BorderSide(
                            color: kGray85,
                            width: 1,
                          ),
                        ),
                      ),
                      child: CachedNetworkImage(
                        imageUrl: task.imgUrl,
                        width: double.infinity,
                        fit: BoxFit.cover,
                        height: 200,
                      ),
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
              const SizedBox(height: 16),
              Text(
                '10 volunteers showed interest',
                style: AppStyle.kRegular12Inter,
              ),
              const SizedBox(height: 20),
              const Divider(color: kBlueAccent),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      task.title,
                      style: AppStyle.kRegular20.copyWith(fontSize: 25),
                    ),
                    Text(task.interest, style: AppStyle.kRegular12Inter),
                    const SizedBox(height: 28),
                    TekElevatedButton(
                      title: 'Show Interest',
                      onPressed: () =>
                          Navigator.pushNamed(context, interestForm),
                    ),
                    const SizedBox(height: 24),
                    Row(
                      children: [
                        const Icon(Icons.favorite_border),
                        const SizedBox(width: 8),
                        Text('Save for later', style: AppStyle.kRegular12Inter)
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
                        InkWell(
                          onTap: () => launchMaps(context, task.location),
                          child: Row(
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
              const SizedBox(height: 40),
              const Divider(color: kBlueAccent),
              const SizedBox(height: 32),
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

  Future<void> launchMaps(BuildContext context, String address) async {
    final url =
        'https://www.google.com/maps/search/?api=1&query=${Uri.encodeComponent(address)}';

    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      snackBarKey.currentState!.showSnackBar(
        const SnackBar(
          content: Text('Could not launch Google Maps.'),
        ),
      );
    }
  }
}
