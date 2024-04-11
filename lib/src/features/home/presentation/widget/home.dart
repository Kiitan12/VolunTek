import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:volun_tek/src/constants/app_style.dart';
import 'package:volun_tek/src/constants/colors.dart';

import '../../application/services/task_services.dart';
import '../provider/task_provider.dart';
import 'refactored/interest.dart';
import 'refactored/selectable_filter_tag.dart';
import 'refactored/task_card.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final filters = ['All', 'Time', 'Location', 'Skills'];

  TaskServices taskServices = TaskServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 32),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 28.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CircleAvatar(
                            radius: 24,
                            backgroundImage: AssetImage('assets/images/profile.png'),
                          ),
                          CircleAvatar(
                            radius: 24,
                            backgroundColor: kYellow,
                            child: Icon(Icons.notifications_outlined),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Text('Discover', style: AppStyle.kHeading1),
                      const SizedBox(height: 28),
                      SizedBox(
                        height: 36,
                        child: TextFormField(
                          onChanged: (value) async {},
                          decoration: InputDecoration(
                            hintText: 'whats your interest today?',
                            hintStyle: AppStyle.kRegular12.copyWith(color: kSilver),
                            filled: true,
                            fillColor: kGray85,
                            suffixIcon: const Icon(Icons.search, color: kSilver),
                            contentPadding:
                            const EdgeInsets.symmetric(horizontal: 20),
                            border: AppStyle.kNoBorder,
                            enabledBorder: AppStyle.kNoBorder,
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: const BorderSide(color: kSilver),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 28),
                      SelectableFilterTag(
                        titles: filters,
                        onSelectionChanged: (index) =>
                            print('Selected index: ${filters[index]}'),
                      ),
                      const SizedBox(height: 20),
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
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                Consumer(builder: (context, ref, child) {
                  final task = ref.watch(getTrendingTask);

                  return task.when(
                    data: (data) {
                      return CarouselSlider.builder(
                        itemCount: data.length,
                        options: CarouselOptions(
                          height: 234,
                          viewportFraction: 0.75,
                          enableInfiniteScroll: false,
                          enlargeCenterPage: false,


                          autoPlay: true,
                        ),
                        itemBuilder: (context, index, realIndex) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 18.0),
                            child: TaskCard(
                              task: data[index],
                            ),
                          );
                        },
                      );
                    },
                    loading: () => const CircularProgressIndicator(),
                    error: (error, stackTrace) {
                      return Text('Error: $error');
                    },
                  );
                }),
                const SizedBox(height: 32),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 28.0),
                  child: Column(
                    children: [
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
                      const SizedBox(height: 28),
                      Consumer(builder: (context, ref, child) {
                        final task = ref.watch(getTrendingTask);

                        return task.when(
                          data: (data) {
                            return ListView.separated(
                              itemCount: data.length,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                return TaskCard(
                                  task: data[index],
                                );
                              },
                              separatorBuilder: (BuildContext context, int index) {
                                return const SizedBox(height: 20);
                              },
                            );
                          },
                          loading: () => const CircularProgressIndicator(),
                          error: (error, stackTrace) {
                            return Text('Error: $error');
                          },
                        );
                      }),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
