import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:volun_tek/src/features/authentication/presentation/widget/interest.dart';

import '../features/authentication/presentation/widget/onboarding.dart';
import 'routes.dart';

class RouteGenerator {
  Route? routeGenerate(RouteSettings route) {
    switch (route.name) {
      case splashRoot:
        return navigateToRoute(const Onboarding());
      case interest:
        return navigateToRoute( Interest());
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
