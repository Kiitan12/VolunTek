import 'package:flutter/material.dart';
import 'package:volun_tek/src/constants/app_style.dart';
import 'package:volun_tek/src/constants/colors.dart';

import 'refactored/interest.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    radius: 28,
                    backgroundImage: AssetImage('assets/images/profile.png'),
                  ),
                  CircleAvatar(
                    radius: 28,
                    backgroundColor: kYellow,
                    child: Icon(Icons.notifications_outlined),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Text('Discover', style: AppStyle.kHeading1),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Search by Cause',
                    style: AppStyle.kRegular20,
                  ),
                  const Icon(Icons.arrow_forward)
                ],
              ),
              const SizedBox(height: 16),
              GridView.builder(
                itemCount: 6,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 2.0,
                ),
                itemBuilder: (context, index) {
                  return const Interest(
                    title: 'Education',
                  );
                },
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Trending',
                    style: AppStyle.kRegular20,
                  ),
                  const Icon(Icons.arrow_forward)
                ],
              ),
              const SizedBox(height: 34),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Recommended',
                    style: AppStyle.kRegular20,
                  ),
                  const Icon(Icons.arrow_forward)
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
