import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:volun_tek/src/features/home/presentation/widget/refactored/task_card.dart';
import 'package:volun_tek/src/routing/routes.dart';

import '../provider/task_provider.dart';

class SearchByCauseView extends ConsumerWidget {
  const SearchByCauseView({super.key, required this.causes, this.title});

  final List causes;
  final String? title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title ?? causes[0].cause),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: ListView.separated(
          itemCount: causes.length,
          shrinkWrap: true,
          physics: const AlwaysScrollableScrollPhysics(),
          separatorBuilder: (context, index) => const SizedBox(height: 20),
          itemBuilder: (context, index) {
            return TaskCard(
              task: causes[index],
              onTap: () {
                ref.read(taskProvider.notifier).state = causes[index];
                Navigator.pushNamed(context, opportunityView);
              },
            );
          },
        ),
      ),
    );
  }
}
