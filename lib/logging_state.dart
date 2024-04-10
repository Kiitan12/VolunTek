import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'src/features/authentication/presentation/controller/sign_in_controller.dart';
import 'src/features/authentication/presentation/widget/login.dart';
import 'src/features/home/presentation/widget/bottom_navigation.dart';
import 'src/utils/validation_helper.dart';

class LoggingState extends StatefulWidget {
  const LoggingState({super.key});

  @override
  State<LoggingState> createState() => _LoggingStateState();
}

class _LoggingStateState extends State<LoggingState> {
  var user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return user != null
        ? const BottomNavigation()
        : Login(
            controller: SignInController(),
            validationHelper: ValidationHelper(),
          );
  }
}
