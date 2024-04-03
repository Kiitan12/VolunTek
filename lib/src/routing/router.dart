import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:volun_tek/src/features/authentication/presentation/widget/confirm_email.dart';
import 'package:volun_tek/src/features/authentication/presentation/widget/interest.dart';
import 'package:volun_tek/src/features/authentication/presentation/widget/reset_password.dart';
import 'package:volun_tek/src/features/authentication/presentation/widget/sign_up.dart';
import 'package:volun_tek/src/utils/validation_helper.dart';

import '../features/authentication/presentation/controller/sign_up_controller.dart';
import '../features/authentication/presentation/widget/login.dart';
import '../features/authentication/presentation/widget/onboarding.dart';
import 'routes.dart';

class RouteGenerator {
  Route? routeGenerate(RouteSettings route) {
    switch (route.name) {
      case splashRoot:
        return navigateToRoute(const Login());
      case interest:
        return navigateToRoute(const Interest());
      case login:
        return navigateToRoute(const Login());
      case signup:
        return navigateToRoute(
          SignUp(
            validationHelper: ValidationHelper(),
            controller: SignUpController(),
          ),
        );
      case confirmMail:
        return navigateToRoute(const ConfirmMail());
      case resetPassword:
        return navigateToRoute(const ResetPassword());
    }
    return null;
  }
}

navigateToRoute(Widget page) {
  if (Platform.isAndroid) {
    return MaterialPageRoute(builder: (context) => page);
  }

  if (Platform.isIOS) {
    return CupertinoPageRoute(builder: (context) => page);
  }
}
