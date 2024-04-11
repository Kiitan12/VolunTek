import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:volun_tek/src/common_widgets/tek_elevated_button.dart';
import 'package:volun_tek/src/constants/app_style.dart';

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
      appBar: AppBar(),
      body: Consumer(builder: (context, ref, child) {
        final task = ref.watch(taskProvider);
        return SafeArea(
          child: Column(
            children: [
              CachedNetworkImage(
                imageUrl: task.imgUrl,
                width: double.infinity,
                fit: BoxFit.cover,
                height: 212,
              ),
              const SizedBox(height: 48),
              Text(
                task.title,
                style: AppStyle.kRegular20.copyWith(fontSize: 25),
              ),
              const SizedBox(height: 20),
              TekElevatedButton(
                  title: 'Show Interest',
                  onPressed: (){}),
              const SizedBox(height: 20),
              const Row(
                children: [
                  Icon(Icons.favorite_border),
                  SizedBox(width: 8),
                  Text('Save for later')
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32.0),
                child: Text(
                  task.description,
                  style: GoogleFonts.inter(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
              )
            ],
          ),
        );
      }),
    );
  }
}
