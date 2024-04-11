import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'home.dart';

var indexProvider = StateProvider<int>((ref) => 0);

class BottomNavigation extends ConsumerStatefulWidget {
  const BottomNavigation({super.key});

  @override
  ConsumerState<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends ConsumerState<BottomNavigation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: ref.watch(indexProvider),
        children: const [
          Home(),
          Center(child: Text('Search')),
          Center(child: Text('Community')),
          Center(child: Text('Profile')),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        child: SizedBox(
          height: 24,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              children: [
                Icon(
                  Icons.home,
                  color: ref.watch(indexProvider) == 0
                      ? Colors.blue
                      : Colors.grey,
                ),
                Icon(
                  Icons.search,
                  color: ref.watch(indexProvider) == 1
                      ? Colors.blue
                      : Colors.grey,
                ),
                Icon(
                  Icons.people,
                  color: ref.watch(indexProvider) == 2
                      ? Colors.blue
                      : Colors.grey,
                ),
                Icon(
                  Icons.person,
                  color: ref.watch(indexProvider) == 3
                      ? Colors.blue
                      : Colors.grey,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
