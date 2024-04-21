import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:volun_tek/src/features/home/application/services/task_services.dart';
import 'package:volun_tek/src/features/home/domain/model/task.dart';

final taskServiceProvider = StateProvider<TaskServices>(
  (ref) => TaskServices(),
);

final getTrendingTask = FutureProvider<List<Task>>((ref) {
  final task = ref.watch(taskServiceProvider);

  return task.getTasks('trendingTasks');
});

final getAllTask = FutureProvider<List<Task>>((ref) {
  final task = ref.watch(taskServiceProvider);

  return task.getTasks('tasks');
});

final loadingTaskProvider = StateNotifierProvider<TaskServices, bool>(
      (ref) => TaskServices(),
);



final taskProvider = StateProvider<Task>(
  (ref) => Task(
    title: '',
    description: '',
    imgUrl: '',
    time: '',
    location: '',
    cause: '',
    id: '',
    favorites: [],
  ),
);

final causesProvider = StateProvider((ref) => []);