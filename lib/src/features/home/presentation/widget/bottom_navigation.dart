import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:volun_tek/src/constants/app_style.dart';
import 'package:volun_tek/src/constants/colors.dart';
import 'package:volun_tek/src/features/profile/presentation/widget/profile.dart';

import '../../../search/presentation/widget/search.dart';
import 'home.dart';

var indexProvider = StateProvider<int>((ref) => 0);

class BottomNavigation extends ConsumerStatefulWidget {
  const BottomNavigation({super.key});

  @override
  ConsumerState<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends ConsumerState<BottomNavigation> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: [
        const Home(),
        const Search(),
        Center(
          child: Text('Coming soon', style: AppStyle.kHeading1),
        ),
        const Profile()
      ][index],
      bottomNavigationBar: NavigationBarTheme(
        data: const NavigationBarThemeData(
          backgroundColor: kGray85,
          indicatorColor: Colors.transparent,
        ),
        child: NavigationBar(
          height: 72,
          selectedIndex: index,
          onDestinationSelected: (int index) {
            setState(() => this.index = index);
          },
          destinations: [
            NavigationDestination(
              icon: Icon(Icons.home),
              label: '',
            ),
            NavigationDestination(
              icon: Icon(Icons.search),
              label: '',
            ),
            NavigationDestination(
              icon: Icon(Icons.people),
              label: '',
            ),
            NavigationDestination(
              icon: Icon(Icons.person_outline),
              label: '',
            ),
          ],
        ),
      ),
    );
  }
}
