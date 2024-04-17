import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badge;
import 'package:volun_tek/src/common_widgets/tek_text_field.dart';

import '../../../../common_widgets/tek_elevated_button.dart';
import '../../../../constants/app_style.dart';
import '../../../../constants/colors.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        title: Text(
          'Profile',
          style: AppStyle.kHeading1.copyWith(
            color: kGray16,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 28.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 24),
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
              const SizedBox(height: 40),
              Text('Name', style: AppStyle.kRegular20),
              const SizedBox(height: 4),
              const TekTextField(hint: 'Enter your name'),
              const SizedBox(height: 16),
              Text('Email', style: AppStyle.kRegular20),
              const SizedBox(height: 4),
              const TekTextField(hint: 'Enter your email'),
              const SizedBox(height: 16),
              Text('Location', style: AppStyle.kRegular20),
              const SizedBox(height: 4),
              const TekTextField(hint: 'Enter your location'),
              const SizedBox(height: 16),
              Text('Bio', style: AppStyle.kRegular20),
              const SizedBox(height: 4),
              const TekTextField(hint: 'Tell us about yourself',
              maxLines: 2,),
              const SizedBox(height: 28),
              Center(
                child: TekElevatedButton(
                  title: 'Save changes',
                  onPressed: ()=> Navigator.pop(context),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
