// import 'package:flutter_test/flutter_test.dart';
// import 'package:mockito/mockito.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:volun_tek/src/features/home/application/services/task_services.dart';
// import 'package:volun_tek/src/features/home/domain/model/task.dart';
//
// class MockFirebaseFirestore extends Mock implements FirebaseFirestore {}
//
// class MockFirebaseAuth extends Mock implements FirebaseAuth {}
//
// class MockCollectionReference extends Mock implements CollectionReference<Map<String, dynamic>> {}
//
// void main() {
//   group('TaskServices', () {
//     late TaskServices taskServices;
//     late MockFirebaseFirestore mockFirebaseFirestore;
//     late MockFirebaseAuth mockFirebaseAuth;
//     late MockCollectionReference mockCollectionReference;
//
//     setUp(() {
//       mockFirebaseFirestore = MockFirebaseFirestore();
//       mockFirebaseAuth = MockFirebaseAuth();
//       taskServices = TaskServices();
//       mockCollectionReference = MockCollectionReference();
//     });
//
//     Task task = Task(
//       id: '1',
//       title: 'Test Task',
//       description: 'This is a test task',
//       cause: 'Test Cause',
//       imgUrl: 'https://example.com/image.jpg',
//       location: 'Test Location',
//       time: '12:00',
//     );
//
//     test('getTasks returns a list of tasks when called', () async {
//       when(mockFirebaseFirestore.collection(any))
//           .thenAnswer((_) => MockCollectionReference());
//
//       final tasks = await taskServices.getTasks('taskType');
//       expect(tasks, isA<List<Task>>());
//     });
//
//
//   });
// }
