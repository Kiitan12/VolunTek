import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:volun_tek/src/features/home/application/services/task_services.dart';
import 'package:volun_tek/src/features/home/domain/model/task.dart';

final taskServiceProvider = StateProvider<TaskServices>(
  (ref) => TaskServices(),
);

final getTrendingTask = FutureProvider<List<Task>>((ref) {
  final task = ref.watch(taskServiceProvider);

  return task.getTrendingTask();
});

final taskProvider = StateProvider<Task>((ref) => Task(
      title: '',
      description: '',
      imgUrl: '',
      time: Timestamp(20, 20),
      location: '',
      interest: '',
      id: '',
      favorites: [],
    ));
