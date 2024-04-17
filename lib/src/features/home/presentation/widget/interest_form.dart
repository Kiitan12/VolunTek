import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:volun_tek/src/common_widgets/tek_elevated_button.dart';
import 'package:volun_tek/src/common_widgets/tek_text_field.dart';
import 'package:volun_tek/src/constants/app_style.dart';
import 'package:volun_tek/src/constants/colors.dart';

import '../provider/task_provider.dart';

class InterestForm extends ConsumerWidget {
  const InterestForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final task = ref.watch(taskProvider);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Interest Form',
          style: AppStyle.kHeading1.copyWith(
            color: kGray16,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              Text(
                task.title,
                style: AppStyle.kRegular20.copyWith(color: kGray16, fontSize: 25),
              ),
              const SizedBox(height: 44),
              Text('Describe yourself?', style: AppStyle.kRegular16Inter),
              const SizedBox(height: 16),
              const TekTextField(
                hint: 'Type here...',
                maxLines: 6,
              ),
              const SizedBox(height: 48),
              Text(
                'Do you have any prior experience volunteering'
                ' or working in a similar field?',
                style: AppStyle.kRegular16Inter,
              ),
              const SizedBox(height: 20),
              const TekTextField(
                hint: 'Type here...',
                maxLines: 6,
              ),
              const SizedBox(height: 48),
              TekElevatedButton(
                title: 'Submit',
                onPressed: () {
                  FirebaseFirestore.instance.collection('interests').add({
                    'task_id': '123',
                    'response1': 'I am a good person',
                    'experience2': 'I have experience in this field',
                    'name': FirebaseAuth.instance.currentUser!.displayName,
                  });
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
