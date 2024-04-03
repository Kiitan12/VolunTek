import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpService {
  final FirebaseAuth auth;

  SignUpService(this.auth);

  Future<void> signUpWithEmailAndPassword({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // await FirebaseFirestore.instance
      //     .collection('users')
      //     .doc(auth.currentUser!.uid)
      //     .set(
      //   {
      //     'email': email,
      //     'name': name,
      //     'uid': auth.currentUser!.uid,
      //   },
      // );
    } on FirebaseAuthException catch (e) {
      throw e.message ?? 'An error occurred';
    }
  }
}
