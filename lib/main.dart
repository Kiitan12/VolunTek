import 'package:flutter/material.dart';

import 'src/routing/router.dart';
import 'src/routing/routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final router = RouteGenerator();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      title: 'VolunTek',
      initialRoute: splashRoot,
      onGenerateRoute: router.routeGenerate,
    );
  }
}
