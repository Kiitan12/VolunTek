import 'package:cloud_firestore/cloud_firestore.dart';

import '../../domain/model/task.dart';

class TaskServices {
  final firestore = FirebaseFirestore.instance;

  Future<List<Task>> getTrendingTask() async {
    try {
      final snapshot = await firestore.collection('trendingTask').get();

      final trendingTask =
          snapshot.docs.map((doc) => Task.fromJson(doc.data())).toList();
      return trendingTask;
    } catch (e) {
      throw Exception(e);
    }
  }
}
