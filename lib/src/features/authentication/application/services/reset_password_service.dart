import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:volun_tek/globals.dart';

import '../../../../constants/colors.dart';

class ResetPasswordService extends StateNotifier<bool> {
  final FirebaseAuth auth;

  ResetPasswordService(this.auth) : super(false);

  Future<void> resetPasswordWithEmail({
    required String email,
  }) async {
    try {
      state = true;
      await auth.sendPasswordResetEmail(email: email).then((value) {
        snackBarKey.currentState!.showSnackBar(const SnackBar(
          content: Text('Password reset link sent to your email'),
          backgroundColor: kBlue,
        ));
        navigatorKey.currentState!.pop();
      });
      state = false;
    } on FirebaseAuthException catch (e) {
      state = false;
      throw e.message ?? 'An error occurred';
    }
  }
}
