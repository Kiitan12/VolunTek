import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:volun_tek/src/features/authentication/presentation/controller/reset_password_controller.dart';
import 'package:volun_tek/src/features/authentication/presentation/widget/confirm_email.dart';
import 'package:volun_tek/src/features/authentication/presentation/widget/interest.dart';
import 'package:volun_tek/src/features/authentication/presentation/widget/reset_password.dart';
import 'package:volun_tek/src/features/authentication/presentation/widget/sign_up.dart';
import 'package:volun_tek/src/features/home/presentation/widget/bottom_navigation.dart';
import 'package:volun_tek/src/features/home/presentation/widget/home.dart';
import 'package:volun_tek/src/features/home/presentation/widget/opportunity_view.dart';
import 'package:volun_tek/src/utils/validation_helper.dart';

import '../../logging_state.dart';
import '../features/authentication/presentation/controller/sign_in_controller.dart';
import '../features/authentication/presentation/controller/sign_up_controller.dart';
import '../features/authentication/presentation/widget/login.dart';
import '../features/authentication/presentation/widget/onboarding.dart';
import '../features/home/presentation/widget/interest_form.dart';
import '../features/profile/presentation/widget/edit_profile.dart';
import '../features/profile/presentation/widget/profile.dart';
import '../features/search/presentation/widget/search.dart';
import 'routes.dart';

class RouteGenerator {
  Route? routeGenerate(RouteSettings route) {
    switch (route.name) {
      case splashRoot:
        return navigateToRoute(
          const Onboarding(),
        );
      case interest:
        return navigateToRoute(const InterestPage());
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
      case home:
        return navigateToRoute(const Home());
      case loggingState:
        return navigateToRoute(const LoggingState());
      case search:
        return navigateToRoute(const Search());
      case opportunityView:
        return navigateToRoute(const OpportunityView());
      case interestForm:
        return navigateToRoute(const InterestForm());
      case profile:
        return navigateToRoute(const Profile());
      case editProfile:
        return navigateToRoute(const EditProfile());
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
