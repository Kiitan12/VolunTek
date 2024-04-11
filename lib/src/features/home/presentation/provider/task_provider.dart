import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:volun_tek/src/features/home/application/services/task_services.dart';
import 'package:volun_tek/src/features/home/domain/model/task.dart';

final taskProvider = StateProvider<TaskServices>(
  (ref) => TaskServices(),
);

final getTrendingTask = FutureProvider<List<Task>>((ref) {
  final task = ref.watch(taskProvider);

  return task.getTrendingTask();
});
