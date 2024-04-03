import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../application/services/sign_up_service.dart';
import '../controller/sign_up_controller.dart';

var hidePasswordProvider = StateProvider<bool>((ref) => true);

final passwordMismatchProvider = StateProvider((ref) => '');

final signupServiceProvider = Provider<SignUpService>((ref) {
  return SignUpService(FirebaseAuth.instance);
});
