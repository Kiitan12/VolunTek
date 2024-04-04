import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:volun_tek/src/features/authentication/application/services/reset_password_service.dart';

final resetPasswordProvider = StateNotifierProvider<ResetPasswordService, bool>(
      (ref) => ResetPasswordService(FirebaseAuth.instance),
);
