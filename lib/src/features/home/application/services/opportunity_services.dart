import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../profile/presentation/provider/user_provider.dart';
import '../../domain/model/task.dart';

class OpportunityServices {
  final FirebaseAuth auth;
  final FirebaseFirestore firestore;

  OpportunityServices({required this.auth, required this.firestore});

  void updateLikeButton(Task task, WidgetRef ref) async {
    final snapshot = await firestore.collection('tasks').doc(task.id).get();
    final user = auth.currentUser;

    if (snapshot.exists) {
      final data = snapshot.data() as Map<String, dynamic>;

      if (data['favorites'].contains(user!.uid)) {
        await removeFavorite(task);
      } else {
        await addFavorite(task);
      }
      ref.refresh(getFavoritesProvider);
    }
  }

  Future<void> addFavorite(Task task) async {
    final user = auth.currentUser;
    final userData = firestore.collection('users').doc(user!.uid);
    final taskData = firestore.collection('tasks').doc(task.id);

    await userData.update({
      'favorites': FieldValue.arrayUnion([task.id])
    });

    taskData.update({
      'favorites': FieldValue.arrayUnion([user.uid])
    });
  }

  Future<void> removeFavorite(Task task) async {
    final user = auth.currentUser;
    final userData = firestore.collection('users').doc(user!.uid);
    final taskData = firestore.collection('tasks').doc(task.id);

    await userData.update({
      'favorites': FieldValue.arrayRemove([task.id])
    });

    taskData.update({
      'favorites': FieldValue.arrayRemove([user.uid])
    });
  }

  void updateRating(rating, task) {
    final user = auth.currentUser;
    final userDocRef = firestore.collection('users').doc(user!.uid);
    final rate = {
      'rating': rating,
      'taskId': task.id,
    };

    userDocRef.get().then((docSnapshot) {
      if (docSnapshot.exists) {
        final data = docSnapshot.data();
        final ratings = data?['ratings'] ?? [];

        // Check if the task ID exists in the ratings array
        final taskIndex =
            ratings.indexWhere((rating) => rating['taskId'] == task.id);

        if (taskIndex != -1) {
          ratings[taskIndex]['rating'] = rating;
          userDocRef.update({'ratings': ratings}).then((_) {
            print('Rating updated successfully!');
          }).catchError((error) {
            print('Failed to update rating: $error');
          });
        } else {
          // Task ID doesn't exist in the array, add the new rating
          userDocRef.update({
            'ratings': FieldValue.arrayUnion([rate])
          }).then((_) {
            print('Rating added successfully!');
          }).catchError((error) {
            print('Failed to add rating: $error');
          });
        }
      } else {
        print('User document does not exist.');
      }
    }).catchError((error) {
      print('Error getting user document: $error');
    });
  }
}
