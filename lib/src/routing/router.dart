import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:volun_tek/src/features/authentication/presentation/controller/reset_password_controller.dart';
import 'package:volun_tek/src/features/authentication/presentation/widget/confirm_email.dart';
import 'package:volun_tek/src/features/authentication/presentation/widget/interest.dart';
import 'package:volun_tek/src/features/authentication/presentation/widget/reset_password.dart';
import 'package:volun_tek/src/features/authentication/presentation/widget/sign_up.dart';
import 'package:volun_tek/src/features/home/presentation/widget/bottom_navigation.dart';
import 'package:volun_tek/src/utils/validation_helper.dart';

import '../features/authentication/presentation/controller/sign_in_controller.dart';
import '../features/authentication/presentation/controller/sign_up_controller.dart';
import '../features/authentication/presentation/widget/login.dart';
import 'routes.dart';

class RouteGenerator {
  Route? routeGenerate(RouteSettings route) {
    switch (route.name) {
      case splashRoot:
        return navigateToRoute(
          Login(
            validationHelper: ValidationHelper(),
            controller: SignInController(),
          ),
        );
      case interest:
        return navigateToRoute(const Interest());
      case login:
        return navigateToRoute(
          Login(
            validationHelper: ValidationHelper(),
            controller: SignInController(),
          ),
        );
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
        return navigateToRoute(
          ResetPassword(
            validationHelper: ValidationHelper(),
            controller: ResetPasswordController(),
          ),
        );
      case bottomNavigation:
        return navigateToRoute(const BottomNavigation());
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
