import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:volun_tek/src/features/home/presentation/widget/refactored/task_card.dart';

import '../../../../constants/app_style.dart';
import '../../../../constants/colors.dart';
import '../../../home/domain/model/task.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  String name = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text('Search'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            SizedBox(
              height: 60,
              child: TextFormField(
                onChanged: (value) async {
                  setState(() => name = value);
                },
                decoration: InputDecoration(
                  hintText: 'whats your interest today?',
                  hintStyle: AppStyle.kRegular12.copyWith(color: kSilver),
                  filled: true,
                  fillColor: kGray85,
                  suffixIcon: const Icon(Icons.search, color: kSilver),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                  border: AppStyle.kNoBorder,
                  enabledBorder: AppStyle.kNoBorder,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(color: kSilver),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('trendingTask')
                    .snapshots(),
                builder: (context, snapshot) {
                  return (snapshot.connectionState == ConnectionState.waiting)
                      ? const CircularProgressIndicator()
                      : ListView.separated(
                          shrinkWrap: true,
                          separatorBuilder: (context, index) =>
                              const SizedBox(height: 16),
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: snapshot.data!.docs.length,
                          itemBuilder: (context, index) {
                            final data = snapshot.data!.docs
                                .map((doc) => Task.fromJson(doc.data()))
                                .toList();
                            if (name.isEmpty) {
                              return TaskCard(task: data[index]);
                            }
                            if (data[index]
                                .title
                                .toLowerCase()
                                .contains(name.toLowerCase())) {
                              return TaskCard(task: data[index]);
                            }

                            return Container();
                          },
                        );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
