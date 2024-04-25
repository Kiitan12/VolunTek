import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:volun_tek/src/constants/app_style.dart';
import 'package:volun_tek/src/constants/colors.dart';
import 'package:volun_tek/src/features/home/presentation/widget/refactored/selectable_filter_tag.dart';
import 'package:volun_tek/src/features/home/presentation/widget/search_by_cause_view.dart';

import '../../../../routing/routes.dart';
import '../../application/services/task_services.dart';
import '../provider/task_provider.dart';
import 'refactored/interest.dart';
import 'refactored/task_card.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  TaskServices taskServices = TaskServices();
  final filters = ['Time', 'Skills'];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Padding(
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top + 24),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 28.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const CircleAvatar(
                          radius: 24,
                          backgroundColor: kBlue,
                          child: Icon(Icons.person),
                        ),
                        InkWell(
                          onTap: () async {
                            // await taskServices
                            //     .uploadTask(uploadTaskList)
                            //     .then((value) => print('Task Uploaded'));
                            Navigator.pushNamed(context, notification);
                          },
                          child: const CircleAvatar(
                            radius: 24,
                            backgroundColor: kYellow,
                            child: Icon(Icons.notifications_outlined),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Text('Discover', style: AppStyle.kHeading1),
                    const SizedBox(height: 28),
                    SizedBox(
                      height: 36,
                      child: TextFormField(
                        onTap: () {
                          Navigator.pushNamed(context, search);
                        },
                        decoration: InputDecoration(
                          hintText: 'whats your interest today?',
                          hintStyle:
                              AppStyle.kRegular12.copyWith(color: kSilver),
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
                    Consumer(builder: (context, ref, child) {
                      final allTask = ref.watch(getAllTask);

                      return allTask.when(
                        data: (data) {
                          return Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SelectableFilterTag(
                                    titles: filters,
                                    onSelectionChanged: (index) {
                                      if (index == 0) {
                                        // arrange by time in ascending order
                                        final sortedData = data
                                            .where(
                                                (task) => task.time.isNotEmpty)
                                            .toList()
                                          ..sort((a, b) =>
                                              a.time.compareTo(b.time));
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    SearchByCauseView(
                                                      causes: sortedData,
                                                      title: 'Filter by Time',
                                                    )));
                                      } else {
                                        /// arrange by skills in ascending order
                                        // final sortedData = data
                                        //     .where((task) => task.skills.isNotEmpty)
                                        //     .toList()
                                        //       ..sort((a, b) => a.skills
                                        //           .compareTo(b.skills));
                                        // Navigator.push(
                                        //     context,
                                        //     MaterialPageRoute(
                                        //         builder: (context) =>
                                        //             SearchByCauseView(
                                        //                 causes: sortedData,
                                        //               title: 'Filter by Skills',
                                        //             )));
                                      }
                                    },
                                  ),
                                  const Icon(Icons.filter_list_rounded)
                                ],
                              ),
                              const SizedBox(height: 24),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Search by Cause',
                                    style: AppStyle.kRegular20,
                                  ),
                                  const Icon(Icons.arrow_forward)
                                ],
                              ),
                              GridView.builder(
                                itemCount: data
                                    .where((task) => task.cause.isNotEmpty)
                                    .map((task) => task.cause)
                                    .toSet()
                                    .toList()
                                    .length,
                                shrinkWrap: true,
                                padding: const EdgeInsets.only(top: 16),
                                physics: const NeverScrollableScrollPhysics(),
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  crossAxisSpacing: 16,
                                  mainAxisExtent: 40,
                                  mainAxisSpacing: 12,
                                ),
                                itemBuilder: (context, index) {
                                  final causes = data
                                      .where((task) => task.cause.isNotEmpty)
                                      .map((task) => task.cause)
                                      .toSet()
                                      .toList();

                                  // add the colors randomly to the causes
                                  const colors = causeColors;
                                  final color =
                                      colors[Random().nextInt(colors.length)];

                                  return Interest(
                                    title: causes[index],
                                    color: color,
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  SearchByCauseView(
                                                      causes: data
                                                          .where((task) =>
                                                              task.cause ==
                                                              causes[index]
                                                                  .toString())
                                                          .toList())));
                                    },
                                  );
                                },
                              ),
                            ],
                          );
                        },
                        error: (error, stackTrace) {
                          return Text('Error: $error');
                        },
                        loading: () => const CircularProgressIndicator(),
                      );
                    }),
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
                    if (data.isEmpty) {
                      return const Center(
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 20.0),
                          child: Text('No task available'),
                        ),
                      );
                    }

                    return CarouselSlider.builder(
                      itemCount: data.length,
                      options: CarouselOptions(
                        height: 234,
                        viewportFraction: 0.76,
                        enableInfiniteScroll: false,
                        enlargeCenterPage: false,
                        autoPlay: true,
                      ),
                      itemBuilder: (context, index, realIndex) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 18.0),
                          child: TaskCard(
                            task: data[index],
                            isTrending: true,
                            onTap: () {
                              ref.read(taskProvider.notifier).state =
                                  data[index];
                              Navigator.pushNamed(context, opportunityView);
                            },
                          ),
                        );
                      },
                    );
                  },
                  loading: () =>
                      const Center(child: CircularProgressIndicator()),
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
                    Consumer(builder: (context, ref, child) {
                      final task = ref.watch(getAllTask);

                      return task.when(
                        data: (data) {
                          if (data.isEmpty) {
                            return const Center(
                              child: Padding(
                                padding: EdgeInsets.symmetric(vertical: 20.0),
                                child: Text('No task available'),
                              ),
                            );
                          }
                          return ListView.separated(
                            itemCount: data.length,
                            shrinkWrap: true,
                            padding: const EdgeInsets.only(top: 20),
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return TaskCard(
                                task: data[index],
                                onTap: () {
                                  ref.read(taskProvider.notifier).state =
                                      data[index];
                                  Navigator.pushNamed(context, opportunityView);
                                },
                              );
                            },
                            separatorBuilder:
                                (BuildContext context, int index) {
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
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}
