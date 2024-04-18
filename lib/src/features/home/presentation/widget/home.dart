import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:volun_tek/src/constants/app_style.dart';
import 'package:volun_tek/src/constants/colors.dart';

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

class _HomeState extends State<Home> with SingleTickerProviderStateMixin{
  final filters = ['All', 'Time', 'Location', 'Skills'];

  TaskServices taskServices = TaskServices();

  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:  EdgeInsets.only(top: MediaQuery.of(context).padding.top + 24),
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
                        CircleAvatar(
                          radius: 24,
                          backgroundImage:
                              AssetImage('assets/images/profile.png'),
                        ),
                        InkWell(
                          onTap: ()=> Navigator.pushNamed(context, notification),
                          child: CircleAvatar(
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
                          suffixIcon:
                              const Icon(Icons.search, color: kSilver),
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
                    TabBar(
                      controller: tabController,
                      indicatorColor: Colors.transparent,
                      indicator: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: kYellow,
                      ),
                      indicatorSize: TabBarIndicatorSize.tab,
                      labelColor: kDarkBlue,
                      unselectedLabelColor: kGray16,
                      tabs: const [
                        Tab(text: 'All'),
                        Tab(text: 'Time'),
                        Tab(text: 'Skills'),
                      ],
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      height: 100,
                      width: double.infinity,
                      child: TabBarView(
                        controller: tabController,
                          children: const [
                        Text('All'),
                        Text('Time'),
                        Text('Skills'),
                      ]),
                    ),


                    const SizedBox(height: 20),
                    Container(),
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
                    GridView.builder(
                      itemCount: 6,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
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
                                onTap: () {
                                  ref.read(taskProvider.notifier).state =
                                      data[index];
                                  Navigator.pushNamed(
                                      context, opportunityView);
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
