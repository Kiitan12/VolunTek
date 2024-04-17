import 'package:flutter/material.dart';
import 'package:volun_tek/src/constants/app_style.dart';
import 'package:badges/badges.dart' as badge;

import '../../../../constants/colors.dart';
import 'refactored/profile_tile.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profile',
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
              Center(
                child: Container(
                  width: 148,
                  decoration: BoxDecoration(
                    color: kYellow,
                    borderRadius: BorderRadius.circular(40),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  alignment: Alignment.center,
                  child: Text('Golden Volunteer',
                      style: AppStyle.kRegular16Inter.copyWith(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      )),
                ),
              ),
              const SizedBox(height: 28),
              Text(
                'ACCOUNT',
                style: AppStyle.kRegular16Inter.copyWith(fontSize: 14),
              ),
              const SizedBox(height: 40),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ProfileTile(
                    imgUrl: 'assets/svg/history.svg',
                    title: 'History',
                  ),
                  ProfileTile(
                    imgUrl: 'assets/svg/badge.svg',
                    title: 'Badges',
                  ),
                ],
              ),
              const SizedBox(height: 40),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ProfileTile(
                    imgUrl: 'assets/svg/favourite.svg',
                    title: 'Favorite',
                  ),
                  ProfileTile(
                    imgUrl: 'assets/svg/edit_profile.svg',
                    title: 'Edit profile',
                  ),
                ],
              ),
              const SizedBox(height: 40),
              Text(
                'SETTINGS',
                style: AppStyle.kRegular16Inter.copyWith(fontSize: 14),
              ),
              const SizedBox(height: 40),
              const Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProfileTile(
                    imgUrl: 'assets/svg/sign_out.svg',
                    title: 'Sign out',
                  ),
                ],
              ),
              const SizedBox(height: 40),
              Text(
                'SUPPORT',
                style: AppStyle.kRegular16Inter.copyWith(fontSize: 14),
              ),
              const SizedBox(height: 40),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProfileTile(
                    imgUrl: 'assets/svg/phone.svg',
                    title: 'Contact us',
                    isCentered: false,
                  ),
                  const SizedBox(height: 40),
                  ProfileTile(
                    imgUrl: 'assets/svg/terms.svg',
                    title: 'Terms & Conditions',
                    isCentered: false,
                  ),
                ],
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
