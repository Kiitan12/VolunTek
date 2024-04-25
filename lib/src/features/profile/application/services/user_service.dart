import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:volun_tek/globals.dart';

import '../../../home/domain/model/task.dart';

class UserService extends StateNotifier<bool> {
  final auth = FirebaseAuth.instance;
  final firestore = FirebaseFirestore.instance;

  UserService() : super(false);

  Future getUserProfile() async {
    final user = auth.currentUser;
    try {
      state = true;
      final userData = await firestore.collection('users').doc(user!.uid).get();
      state = false;
      return userData.data();
    } catch (e) {
      state = false;
      rethrow;
    }
  }

  Future updateUserProfile(Map<String, dynamic> data) async {
    final user = auth.currentUser;
    try {
      state = true;
      await firestore.collection('users').doc(user!.uid).update(data);
      snackBarKey.currentState!.showSnackBar(
        const SnackBar(
          content: Text('Profile updated successfully'),
        ),
      );
      state = false;
    } catch (e) {
      state = false;
      rethrow;
    }
  }

  getProfileImage() async {
    final user = auth.currentUser;
    final userData = await firestore.collection('users').doc(user!.uid).get();

    return userData.data()!['profileImage'];
  }

  Future updateProfileImage(String url) async {
    final user = auth.currentUser;
    await firestore
        .collection('users')
        .doc(user!.uid)
        .update({'profileImage': url});
  }

  Future<List<Task>> getFavorites() async {
    try {
      state = true;
      final user = auth.currentUser;
      final userData = await firestore.collection('users').doc(user!.uid).get();
      final List<dynamic> favorites = userData.data()!['favorites'];
      final List<Task> tasks = [];

      for (final id in favorites) {
        final task = await firestore.collection('trendingTask').doc(id).get();
        tasks.add(Task.fromJson(task.data()!));
      }
      state = false;
      return tasks;
    } catch (e) {
      state = false;
      rethrow;
    }
  }

  Future<void> addFavorite(String taskId) async {
    final user = auth.currentUser;
    final userData = await firestore.collection('users').doc(user!.uid).get();
    final List<dynamic> favorites = userData.data()!['favorites'];
    favorites.add(taskId);
    await firestore
        .collection('users')
        .doc(user.uid)
        .update({'favorites': favorites});
  }

  Future<void> removeFavorite(String taskId) async {
    final user = auth.currentUser;
    final userData = await firestore.collection('users').doc(user!.uid).get();
    final List<dynamic> favorites = userData.data()!['favorites'];
    favorites.remove(taskId);
    await firestore
        .collection('users')
        .doc(user.uid)
        .update({'favorites': favorites});
  }

  Future<List<Task>> getInterestHistory() async {
    try {
      state = true;
      final user = auth.currentUser;
      final userData = await firestore.collection('interests').get();
      final List<dynamic> taskId = userData.docs.map((e) {
        if (e.data()['uid'] == user!.uid) {
          return e.data()['task_id'];
        }
      }).toList();
      final tasks = await firestore.collection('tasks').get();
      final List<Task> taskList = [];
      for (final task in tasks.docs) {
        if (taskId.contains(task.data()['id'])) {
          taskList.add(Task.fromJson(task.data()));
        }
      }
      state = false;
      return taskList;
    } catch (e) {
      state = false;
      rethrow;
    }
  }
}
